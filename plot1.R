##read
#electricity <- read.csv("household_power_consumption.txt", sep = ";",na.strings = "?")
## filter 2007-02-01 2007-02-02
electr <- electricity[electricity$Date == '1/2/2007' | electricity$Date == '2/2/2007' ,]
png("plot1.png",width = 480, height = 480, units = "px")
hist(electr$Global_active_power, col = 'red', main = "Global Active Power", xlab = 'Global Active Power (kilowatts)' )
dev.off()