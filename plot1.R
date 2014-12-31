##############################################################################
# DOWNLOAD AND UNCOMPRESS
# Code for downloading and uncompressing test data resides in getdata.R
# Code is executed as we source getdata.R
# File "household_power_consumption.zip" is downloaded only once
# If for some reason file must be downloaded again, manualr remove the existing file from your working directory.
source("getdata.R")

##############################################################################
# LOAD DATA
library(dplyr)
data_file <- "household_power_consumption.txt"

hh_power_consumption  <- 
  read.table(data_file, header = T, sep=";", stringsAsFactors = F) %>%
  tbl_df() %>%
  mutate(Date = as.Date(Date, "%e/%m/%Y")) %>%
  filter(Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02") ) %>%
  mutate(Global_active_power = as.numeric(Global_active_power))

pngdevice <- png(filename = "plot1.png",
    width = 480, height = 480, units = "px")

with(hh_power_consumption, hist(Global_active_power , 
                                main = 'Global Active Power', 
                                xlab = "Global Active Power (kilowatts)", col = "red")
     )

dev.off()

