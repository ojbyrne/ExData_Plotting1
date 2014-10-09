# common code
 power = read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
 power$DateTime = strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M")
 power_subset = subset(power, as.Date(power$Date, "%d/%m/%Y") == "2007-02-01"|as.Date(power$Date, "%d/%m/%Y") == "2007-02-02")
 # plot 2
 png(file="plot2.png")
 plot(power_subset$DateTime, power_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
 dev.off()
