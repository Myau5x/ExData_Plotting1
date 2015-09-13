##read
electricity <- read.csv("household_power_consumption.txt", sep = ";",na.strings = "?")
## filter 2007-02-01 2007-02-02
electr <- electricity[electricity$Date == '1/2/2007' | electricity$Date == '2/2/2007' ,]
# add column with system date/time
electr$sTime <- strptime( paste (electr$Date,electr$Time),format = "%d/%m/%Y%H:%M:%S" )

png("plot3.png",width = 480, height = 480, units = "px")

with ( electr, plot(sTime,Sub_metering_1,type = 'l', ylab = 'Energy sub metering', xlab = ''))
with ( electr, lines(sTime,Sub_metering_2, col = 'red' ))
with ( electr, lines(sTime,Sub_metering_3, col = 'blue' ))
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1",'Sub_metering_2',"Sub_metering_3"))
dev.off()