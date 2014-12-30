# This script 

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
projectDatafile <- "household_power_consumption.zip"

cat("\nDownloadoing data set if not already exists: " , projectDatafile)
if (! file.exists(projectDatafile)){
  cat("\nStaring data download")
  download.file(url , projectDatafile, method = "curl")
} else {
  cat("\nFile already downloaded")
} 

library(R.utils)
unzip(projectDatafile)
