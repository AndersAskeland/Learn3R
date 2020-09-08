## code to prepare `mmash` dataset goes here

usethis::use_data(mmash, overwrite = TRUE)

# load packages
library(here) # Point to wd
library(fs) # Delete stuff

# Download data
mmash_link <- "https://physionet.org/static/published-projects/mmash/multilevel-monitoring-of-activity-and-sleep-in-healthy-people-1.0.0.zip"

download.file(mmash_link, destfile = here("data-raw/mmash-data.zip"))

# Add data to gitignore
usethis::use_git_ignore(("data-raw/mmash-data.zip"))
usethis::use_git_ignore(("data-raw/mmash/"))


# Unzip
unzip(here("data-raw/mmash-data.zip"),
      exdir = here('data-raw/'),
      junkpaths = T)

unzip(here("data-raw/MMASH.zip"),
      exdir = here("data-raw/mmash"),
      junkpaths = T)


# Delete uneeded files
file_delete(here(c("data-raw/MMASH.zip", "data-raw/mmash-data.zip", "data-raw/LICENSE.txt")))


# Read data
readr::read_csv("data-raw/mmash-data.zip")

