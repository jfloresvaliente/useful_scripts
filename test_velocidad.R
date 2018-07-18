library(tidyverse)
library(data.table)

# For this example I’ve created a dummy set of raw data that we can make 
# some arbitrary selection and transformation on and save as clean.
# In this case I’ve created dates with some observations happening each day,
# labelled as 'a' to 'c'.
# Alongside this I’ve duplicated these columns to give us something to drop.
# Dummy data created with:

# Dummy files to process
dir.create('./temp/raw', recursive=T)
dir.create('./temp/clean')

invisible(lapply(1500:2000, function(i){
  date = seq.Date(as.Date(paste0(i, '-01-01')),
                  as.Date(paste0(i, '-12-31')),
                  by=1)
  a  = rnorm(length(date))
  a1 = rnorm(length(date))
  a2 = rnorm(length(date))
  b  = rpois(length(date), 10)
  b1 = rpois(length(date), 10)
  b2 = rpois(length(date), 10)
  c  = rexp(length(date), 5)
  c1 = rexp(length(date), 5)
  c2 = rexp(length(date), 5)
  
  write_csv(data.frame(date, a, b, c),
            paste0('./temp/raw/file_', i, '.csv'))
}))


# We’ve now got a directory with 68 csv files,
# each containing some fabricated daily data.
# In order to read files into R,
# the first thing to do is get a path to it,
# we can do this with `list.files()`:

# Get a vector of file names
f = list.files('./temp/raw', pattern='file')

# Interactive dplyr
# system.time(
#   walk(f, ~ paste0('./temp/raw/', .x) %>%
#          read_csv() %>%
#          select(date, a, b, c) %>%
#          gather(variable, value, -date) %>%
#          write_csv(paste0('./temp/clean/', .x)))
# )

# We can adapt the above slightly to make it a function.
# We’re now able to pass our tidyverse code individual file names,
# here represented by `i`. Finally, the clean data are written out
# into the clean folder. In the real world we may also want to change 
# the file name to reflect the clean status.

# As a function
read_clean_write = function(i){
  paste0('./temp/raw/', i) %>%
    read_csv() %>%
    select(date, a, b, c) %>%
    gather(variable, value, -date) %>%
    write_csv(paste0('./temp/clean/', i))
}

# We can make a second function using the data.table package,
# which is renowned for its speed:

# data.table function
fread_clean_fwrite = function(i){
  paste0('./temp/raw/', i) %>%
    fread() %>%
    select(date, a, b, c) %>%
    melt.data.table(id.vars = 'date') %>%
    fwrite(paste0('./temp/clean/', i))
}

# Finally, we can run either of the above
# two functions as a loop (usually bad), lapply or something else:


# # Loop
# system.time(
#   for (j in f){
#     read_clean_write(j)
#   }
# )
# 
# # lapply
# system.time(lapply(f, read_clean_write))

# But how fast were they? Can we get faster? Thankfully R provides `system.time()` 
# for timing code execution. In order to get faster, it makes sense to use all 
# the processing power our machines have. The ‘parallel’ library has some great 
# tools to help us run our jobs in parallel and take advantage of multicore processing.
# My favourite is `mclapply()`, because it is very very easy to take an `lapply` 
# and make it multicore. Note that mclapply doesn’t work on Windows.
# The following script runs the `read_clean_write()` function in a for 
# loop (boo, hiss), lapply and mclapply. I’ve run these as list elements
# to make life easier later on.

library(parallel)

numC <- detectCores() - 2

# Loop
times = list(
  purrr=system.time(
    walk(f, read_clean_write)
  ),
  forloop=system.time(
    for (j in f){
      read_clean_write(j)
    }
  ),
  lapply = system.time(
    lapply(f, read_clean_write)
  ),
  lapply_data.table=system.time(
    lapply(f, fread_clean_fwrite)
  ),
  mclapply = system.time(
    mclapply(f, mc.cores=numC, read_clean_write)
  ),
  mclapply_data.table=system.time(
    mclapply(f, mc.cores=numC, fread_clean_fwrite)
  )
)


# Next we can plot up these results. I’m using sapply to get only
# the elapsed time from the proc.time object, and then cleaning 
# the elapsed part from the vector name.

x = sapply(times, function(i){i['elapsed']})
names(x) = substr(names(x), 1, nchar(names(x)) - 8)

png(filename = 'VelocidadTest.png', width = 850, height = 450, res = 120)
par(mar=c(5, 8.5, 4, 2) + 0.1)
barplot(x, names.arg=names(x),
        main=paste('Elapsed time on an Intel i7') ,
        xlab='Seconds', horiz=T, las=1)
par(mar=c(5, 4, 4, 2) + 0.1)
dev.off()

# Unsurprisingly mclapply is the clear winner.
# It's spreading the work across four cores instead of one,
# so unless the job is very simple it will always be fastest!
# Having run this code a few times, I noticed the results
# are not consistent. Because we've been working in code 
# we can examine the variability. I've done this by running 
# each method 100 times:

# Many times run
times = lapply(1:100, function(i){
  list(
    purrr=system.time(
      walk(f, read_clean_write)
    ),
    forloop=system.time(
      for (j in f){
        read_clean_write(j)
      }
    ),
    lapply = system.time(
      lapply(f, read_clean_write)
    ),
    lapply_data.table=system.time(
      lapply(f, fread_clean_fwrite)
    ),
    mclapply = system.time(
      mclapply(f, mc.cores=4, read_clean_write)
    ),
    mclapply_data.table=system.time(
      mclapply(f, mc.cores=4, fread_clean_fwrite)
    )
  )
})

x = lapply(times, function(i){
  y = sapply(i, function(k){k["elapsed"]})
  names(y) = substr(names(y), 1, nchar(names(y))-8)
  y
})

x = lapply(seq_along(x), function(i){
  data.frame(run=i,
             purrr=x[[i]]["purrr"],
             forloop=x[[i]]["forloop"],
             lapply=x[[i]]["lapply"],
             lapply_data.table=x[[i]]["lapply_data.table"],
             mclapply=x[[i]]["mclapply"],
             mclapply_data.table=x[[i]]["mclapply_data.table"])
})
x = do.call("rbind.data.frame", x)

# My poor computer! Now we can plot these results up.
# I've chosen violin plots to help us see the distribution of results:

png("./temp/violin.png", height=500, width=1000)
x %>%
  gather(variable, value, -run) %>%
  ggplot(aes(variable, value)) +
  geom_violin(fill="grey70") +
  labs(title="100 runs comparing read, transform and write in R",
       x="",
       y="Seconds") +
  coord_flip() +
  theme_bw() +
  theme(text = element_text(size=20),
        panel.grid=element_blank())
dev.off()
