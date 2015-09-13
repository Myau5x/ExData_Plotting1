##read
electricity <- read.csv("household_power_consumption.txt", sep = ";",na.strings = "?")
## filter 2007-02-01 2007-02-02
electr <- electricity[electricity$Date == '1/2/2007' | electricity$Date == '2/2/2007' ,]
# add column with system date/time
electr$sTime <- strptime( paste (electr$Date,electr$Time),format = "%d/%m/%Y%H:%M:%S" )
png("plot2.png",width = 480, height = 480, units = "px")

plot(electr$sTime, electr$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = '')
dev.off()