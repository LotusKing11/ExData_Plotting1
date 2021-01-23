
#load the required package
library("data.table")

#set correct working directory
setwd("~/Documents/Data Science Course/ExploratoryAnalysis/Wk1Proj")

#Read data from file
pwrconDT <- data.table::fread(input = "household_power_consumption.txt"
                              , na.strings="?")

# create datetime variable as combo of date and time so we can filter and graph POSIXct date by time of day
pwrconDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates as specified in instructions
pwrconDT <- pwrconDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]


png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# Plot 1
plot(pwrconDT[, dateTime], pwrconDT[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

# Plot 2
plot(pwrconDT[, dateTime],pwrconDT[, Voltage], type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(pwrconDT[, dateTime], pwrconDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(pwrconDT[, dateTime], pwrconDT[, Sub_metering_2], col="red")
lines(pwrconDT[, dateTime], pwrconDT[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

# Plot 4
plot(pwrconDT[, dateTime], pwrconDT[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
