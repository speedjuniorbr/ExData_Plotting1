## Author: Expedito Junior (SpeedJuniorBr)
## File: plot1.R
## Description: Generate Histogram Global Active Power.

## Read File
dt <- read.csv2("data/household_power_consumption.txt", sep=";")

## Adjust variables format tidy
dt$Timeframe <- strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S")
dt$Global_active_power <- as.numeric(dt$Global_active_power, digits = 3)
dt$Global_reactive_power <- as.numeric(dt$Global_reactive_power, digits = 3)
dt$Voltage <- as.numeric(dt$Voltage, digits = 3)
dt$Global_intensity <- as.numeric(dt$Global_intensity, digits = 3)
dt$Sub_metering_1 <- as.numeric(dt$Sub_metering_1, digits = 3)
dt$Sub_metering_2 <- as.numeric(dt$Sub_metering_2, digits = 3)
dt$Sub_metering_3 <- as.numeric(dt$Sub_metering_3, digits = 3)

## Get subset data from 2007-02-01 to 2007-02-02
dtperiod <- subset(dt, Timeframe >= as.Date("2007-02-01") & Timeframe < as.Date("2007-02-03"))

## Plot
hist(dtperiod$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.copy(png, file="plot1.png")
dev.off()

