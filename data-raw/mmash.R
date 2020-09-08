## code to prepare `mmash` dataset goes here

usethis::use_data(mmash, overwrite = TRUE)

# load packages
library(here)

# Download data
mmash_link <- "https://physionet.org/static/published-projects/mmash/multilevel-monitoring-of-activity-and-sleep-in-healthy-people-1.0.0.zip"

download.file(mmash_link, destfile = here("data-raw/mmash-data.zip"))

# Add data to gitignore
usethis::use_git_ignore(("data-raw/mmash-data.zip"))


# Unzip
unzip(here("data-raw/mmash-data.zip"),
      exdir = here('data-raw/'),
      junkpaths = T)

unzip(here("data-raw/MMASH.zip"),
      exdir = here("data-raw/"),
      junkpaths = T)

# Read data
readr::read_csv("data-raw/mmash-data.zip")
