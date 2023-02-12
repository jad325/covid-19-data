# Julia DeLitta
# BIS 244-018
# Professor Davoodi
# February 12th, 2023
# Assignment 02 - Github

install.packages('dplyr')
install.packages('tidyverse')

# Clear out Console and Environment
rm(list=ls(all=TRUE))
cat("\014")

# We'll use package "readr", which is part of the tidyverse
library(dplyr)
library(tidyverse)
library(readr)

# Storing the path of the current working directory
Temp <- getwd()

# Switching the working directory to the covid-19-data subfolder
setwd("./covid-19-data/")

# Reading the us.counties.csv in as a data frame
STATES <- read_csv("us-states.csv")

# Examining the data
View(STATES)

# Using filter()to get just Pennsylvania state
PENNSYLVANIA <- filter(STATES, state=="Pennsylvania")
View(PENNSYLVANIA)

# Set n to length of data set
n <- length(PENNSYLVANIA$date)

# Initialize new variable in data frame
PENNSYLVANIA$incr_cases <- 2

View(PENNSYLVANIA)

# Calculate values for other than first row using FOR loop
for (i in 2:n) {
  PENNSYLVANIA$incr_cases[i] <- (PENNSYLVANIA$cases[i]-PENNSYLVANIA$cases[i-1]) 
}
View(PENNSYLVANIA)

# Initialize a second new variable in data frame
PENNSYLVANIA$incr_deaths <- 0

# Calculate values for other than first row using FOR loop
for (i in 2:n) {
  PENNSYLVANIA$incr_deaths[i] <- (PENNSYLVANIA$deaths[i]-PENNSYLVANIA$deaths[i-1]) 
}
View(PENNSYLVANIA)

# Calculating and printing the standard deviation of the two cases
cat("SD of case increases in PA:", sd(PENNSYLVANIA$incr_cases), na.rm=TRUE)
cat("SD of death increases in PA:", sd(PENNSYLVANIA$incr_deaths), na.rm=TRUE)
