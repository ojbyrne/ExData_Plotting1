# common code
 power = read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
 power$DateTime = strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M")
 power_subset = subset(power, as.Date(power$Date, "%d/%m/%Y") == "2007-02-01"|as.Date(power$Date, "%d/%m/%Y") == "2007-02-02")
 # plot 3
 png(file="plot3.png")
 plot(power_subset$DateTime, power_subset$Sub_metering_1, type="n", xlab="", ylab="Energy submetering")
 lines(power_subset$DateTime, power_subset$Sub_metering_1)
 lines(power_subset$DateTime, power_subset$Sub_metering_2, col="red")
 lines(power_subset$DateTime, power_subset$Sub_metering_3, col="blue")
 legend("topright", lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), col=c("black", "red", "blue"))
 dev.off()
