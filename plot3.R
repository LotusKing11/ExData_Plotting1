#load the required package
library("data.table")

#set correct working directory
setwd("~/Documents/Data Science Course/ExploratoryAnalysis/Wk1Proj")

#Read data from file then subsets data for specified dates
pwrconDT <- data.table::fread(input = "household_power_consumption.txt"
                              , na.strings="?")

# create datetime variable as combo of date and time so we can filter and graph POSIXct date by time of day
pwrconDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates as specified in instructions
pwrconDT <- pwrconDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot3.png", width=480, height=480)

# Plot 3
plot(pwrconDT[, dateTime], pwrconDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(pwrconDT[, dateTime], pwrconDT[, Sub_metering_2],col="red")
lines(pwrconDT[, dateTime], pwrconDT[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()