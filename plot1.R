##############################################################################
# DOWNLOAD AND UNCOMPRESS
# Code for downloading and uncompressing test data resides in getdata.R
# Code is executed as we source getdata.R
# File "household_power_consumption.zip" is downloaded only once
# If for some reason file must be downloaded again, manualr remove the existing file from your working directory.
#
# Script also uncompresses household_power_consumption.zip to create "household_power_consumption.txt"
source("getdata.R")

##############################################################################
# LOAD And FILTER DATA
library(dplyr)

# We are reading this data_file using read.table function
data_file <- "household_power_consumption.txt"

# As we are reading the data file we are also performing following transformations using chaining
#   Converting Date field using as.Date
#   Filtering data for 2007-02-01 and 2007-02-02
#   Filtering rows containing "?" in Global_active_power
#   Converting Global_active_power to numeric

hh_power_consumption  <- 
  read.table(data_file, header = T, sep=";", stringsAsFactors = F) %>%
  tbl_df() %>%
  mutate(Date = as.Date(Date, "%e/%m/%Y")) %>%
  filter(Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"), Global_active_power != "?" ) %>%
  mutate(Global_active_power = as.numeric(Global_active_power))

##############################################################################
# CREATE PNG File

# Creating png device with expected size
pngdevice <- png(filename = "plot1.png",
    width = 480, height = 480, units = "px")

# Creating histogram with required axis and chart title
with(hh_power_consumption, hist(Global_active_power , 
                                main = 'Global Active Power', 
                                xlab = "Global Active Power (kilowatts)", col = "red")
     )

# Winding up by closing png device
dev.off()

cat("\nCreated plot1.png in your working directory")

