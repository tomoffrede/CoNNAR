# Tom Offrede

library(tidyverse)

folder <- paste0(here::here(), "/data/")
folder2 <- paste0(here::here(), "/data/all/")

# Copy all files from one folder to another

og <- list.files(folder, "TextGrid", recursive=TRUE)

for(o in og){
  file <- stringr::str_split(o, fixed("/"))[[1]][[4]]
  file.copy(from = paste0(folder, o),
            to = paste0(folder2, file))
}

# # Create folders
# 
# for(d in dyads){
#   dir.create(paste0(folder, d))
# }

# # Copy files from a general folder into their appropriate folder

t <- list.files(folder2)

for(f in t){
  for(d in dyads){
    folderCurrentDyad <- paste0(folder, d, "/")
    if(grepl(d, f)){
      file <- paste0(folder2, f, "/")
      file.copy(file, folderCurrentDyad, overwrite=TRUE)
    }
  }
}

# Copy files from their individual folder into a folder with all speakers

## Option 1

for(d in dyads){
  folderC <- paste0(folder, d, "/")
  # files <- list.files(folderC, "^[A-Z]{3}-(D|L)[0-9]\\.TextGrid$")
  files <- list.files(folderC, "\\.txt$")
  files <- files[!grepl("Register", files)]
  for(f in files){
    file <- paste0(folderC, f, "/")
    file.copy(file, folder2, overwrite = TRUE)
  }
}

## Option 2

files <- list.files(folder, recursive=TRUE)

for(file in files){
  filename <- stringr::str_split(file, fixed("/"))[[1]][[2]]
  if(grepl("\\.wav", file)){
    file.copy(from= paste0(folder, file), to=paste0(folder2, filename))
  }
}


# Delete files

for(d in dyads){
  folderC <- paste0(folder, d, "/")
  txtToRemove <- list.files(folderC, "\\.txt")
  txtToRemove <- txtToRemove[!grepl("Register", txtToRemove)]
  tgToRemove <- list.files(folderC, "\\.TextGrid")
  # tgToRemove <- tgToRemove[!grepl("OG", tgToRemove)]
  for(f in c(txtToRemove, tgToRemove)){
    file.remove(paste0(folderC, f))
  }
}

# Delete files based on their name

files <- list.files(folder, recursive=TRUE)

for(file in files[!grepl("RData", files)]){
  if(!grepl("free", file)){
    file.remove(paste0(folder, file))
  }
}

# Rename files

## Option 1

files <- list.files(folder, "OverlapSp.TextGrid")
# files <- files[!grepl("OG", files)]

for(f in files){
  newName <- gsub("-OverlapSp", "", f)
  file.rename(from = paste0(folder, f),
              to = paste0(folder, newName))
}

## Option 2

for(d in dyads){
  folderC <- paste0(folder, d, "/")
  files <- list.files(folderC, "OG")
  newName <- gsub("-OG", "", f)
  file.rename(from = paste0(folder, f),
              to = paste0(folder, newName))
}
