data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
           na.strings = "NA", skip = 66636, nrows = 2880)
colnames(data) = c("Date","Time","Global_active_power","Global_reactive_power",
                   "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

x <- paste(data$Date, data$Time)
x <-  strptime(x, "%d/%m/%Y %H:%M:%S")

png('plot4.png')

par(mfcol=c(2,2))
par(mar=c(3,4,1,1))

plot(x,data[,3], xlab='', ylab="Global Active Power (kilowatts)", type = "l",cex.lab=0.8)

plot(x,data[,7], xlab='', ylab="Energy sub metering", type="l",cex.lab=0.8)
points(x,data[,8], col="red", type="l")
points(x,data[,9], col="blue", type="l")
legend("topright", pch="-", col=c("black","red","blue"), 
       legend=c("Sub_met_1","Sub_met_2","Sub_met_3"),cex=0.8)


plot(x,data[,5], xlab='datetime', ylab="Voltage", type = "l",cex.lab=0.8)

plot(x,data[,4], xlab='datetime', ylab="Voltage", type = "l",cex.lab=0.8)

dev.off()
