data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
           na.strings = "NA", skip = 66636, nrows = 2880)
colnames(data) = c("Date","Time","Global_active_power","Global_reactive_power",
                   "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

x <- paste(data$Date, data$Time)
x <-  strptime(x, "%d/%m/%Y %H:%M:%S")

png('plot2.png')

plot(x,data[,3], xlab='', ylab="Global Active Power (kilowatts)", type = "l")

dev.off()
