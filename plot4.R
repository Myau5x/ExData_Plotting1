##read
electricity <- read.csv("household_power_consumption.txt", sep = ";",na.strings = "?")
## filter 2007-02-01 2007-02-02
electr <- electricity[electricity$Date == '1/2/2007' | electricity$Date == '2/2/2007' ,]
# add column with system date/time
electr$sTime <- strptime( paste (electr$Date,electr$Time),format = "%d/%m/%Y%H:%M:%S" )

png("plot4.png",width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
with ( electr, {
  plot(sTime, Global_active_power, type = 'l', ylab = 'Global Active Power', xlab = '')
  
  plot(sTime, Voltage, type = 'l', ylab = 'Voltage', xlab = 'datetime')
  
  plot(sTime,Sub_metering_1,type = 'l', ylab = 'Energy sub metering', xlab = '')
  lines(sTime,Sub_metering_2, col = 'red' )
  lines(sTime,Sub_metering_3, col = 'blue' )
  legend("topright", bty = 'n', lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1",'Sub_metering_2',"Sub_metering_3"))
  
      
  plot(sTime, Global_reactive_power , type = 'l', ylab = 'Global_ Reactive_power', xlab = 'datetime')
  
      })
dev.off()