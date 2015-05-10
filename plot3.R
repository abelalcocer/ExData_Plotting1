data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
           na.strings = "NA", skip = 66636, nrows = 2880)
colnames(data) = c("Date","Time","Global_active_power","Global_reactive_power",
                   "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")


png('plot3.png')

x <- paste(data$Date, data$Time)
x <-  strptime(x, "%d/%m/%Y %H:%M:%S")

plot(x,data[,7], xlab='', ylab="Energy sub metering", type="l")
points(x,data[,8], col="red", type="l")
points(x,data[,9], col="blue", type="l")
legend("topright", pch="-", col=c("black","red","blue"), legen=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.off()
