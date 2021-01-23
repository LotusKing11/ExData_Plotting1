#load the required package
library("data.table")

#set correct working directory
setwd("~/Documents/Data Science Course/ExploratoryAnalysis/Wk1Proj")

#Read data from file then subsets data for specified dates
pwrconDT <- data.table::fread(input = "household_power_consumption.txt"
                              , na.strings="?")

# create datetime variable as combo of date and time so we can filter and graph POSIXct date by time of day
pwrconDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
pwrconDT <- pwrconDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

## Plot 2
plot(x = pwrconDT[, dateTime]
     , y = pwrconDT[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()