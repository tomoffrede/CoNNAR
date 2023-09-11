# Tom Offrede
# check distribution of f0 values

library(tidyverse)

folder <- paste0(here::here(), "/data/all/")
files <- list.files(folder, "\\.txt")

# f0 mean

for(f in files){
  txt <- read.table(paste0(folder, f), header = TRUE, na.strings = "--undefined--")
  plot(txt$f0mean, main="f0 mean")
  readline()
}

# f0 median

for(f in files){
  txt <- read.table(paste0(folder, f), header = TRUE, na.strings = "--undefined--")
  plot(txt$f0med, main="f0 median")
  readline()
}

# f0 SD

for(f in files){
  txt <- read.table(paste0(folder, f), header = TRUE, na.strings = "--undefined--")
  plot(txt$f0sd, main="f0 SD")
  readline()
}

# f0 IQR

for(f in files){
  txt <- read.table(paste0(folder, f), header = TRUE, na.strings = "--undefined--")
  plot(txt$f0IQR, main="f0 IQR")
  readline()
}
