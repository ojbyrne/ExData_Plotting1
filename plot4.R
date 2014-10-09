# common code
 power = read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
 power$DateTime = strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M")
 power_subset = subset(power, as.Date(power$Date, "%d/%m/%Y") == "2007-02-01"|as.Date(power$Date, "%d/%m/%Y") == "2007-02-02")
 # plot 4
 png(file="plot4.png")
 par(mfrow = c(2, 2))
 plot(power_subset$DateTime, power_subset$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")
 plot(power_subset$DateTime, power_subset$Voltage, type = "l", ylab = "Voltage")
 plot(power_subset$DateTime, power_subset$Sub_metering_1, type="n", xlab="", ylab="Energy submetering")
 lines(power_subset$DateTime, power_subset$Sub_metering_1)
 lines(power_subset$DateTime, power_subset$Sub_metering_2, col="red")
 lines(power_subset$DateTime, power_subset$Sub_metering_3, col="blue")
 legend("topright", lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), col=c("black", "red", "blue"))
 plot(power_subset$DateTime, power_subset$Global_reactive_power, type = "l", ylab="global_reactive_power")
dev.off()
 
