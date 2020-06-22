## Author: Expedito Junior (SpeedJuniorBr)
## File: plot3.R
## Description: Energy sub metering 1, 2 and 3 including label per time .

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

## Configure frames
par(mfrow = c(2,2))

## Plot 1
plot(dtperiod$Timeframe, dtperiod$Global_active_power, ylab = "Global Active Power (killowats)", xlab="Datetime", type="l")

## Plot 2
plot(dtperiod$Timeframe, dtperiod$Voltage, ylab = "Voltage (Volts)", xlab="Datetime", type="l")

## Plot 3
with(dtperiod, plot(Timeframe, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "Datetime"))
with(dtperiod, points(Timeframe, Sub_metering_2, type = "l", col="red"))
with(dtperiod, points(Timeframe, Sub_metering_3, type = "l", col="blue"))
legend("topright", pch=45, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Plot 4
plot(dtperiod$Timeframe, dtperiod$Global_reactive_power, ylab = "Global Reactive Power (killowats)", xlab="Datetime", type="l")

dev.copy(png, file="plot4.png", width = 700, height=700)
dev.off()

