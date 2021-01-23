#load the required package
library("data.table")

#set correct working directory
setwd("~/Documents/Data Science Course/ExploratoryAnalysis/Wk1Proj")

#Read data from file then subsets data for specified dates
pwrconDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?")

# Change Date Column Values to Date Type
pwrconDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 to 2007-02-02
pwrconDT <- pwrconDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Plot 1
hist(pwrconDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()