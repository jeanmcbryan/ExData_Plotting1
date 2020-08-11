## Import the data
datafull<-read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

## Subset just the data from 1st Feb 2007 and 2nd Feb 2007
data1st<-datafull[which(datafull$Date == "1/2/2007"), ]
data2nd<-datafull[which(datafull$Date == "2/2/2007"), ]
data<-data.frame()
data<-rbind(data, data1st, data2nd)

## Let R recognise dates and times
data$Combo<-paste(data$Date, data$Time)
when<-c(data$Combo)
x<-strptime(when, "%d/%m/%Y %H:%M:%S")

## Plot the graph and save it as png file
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(data, {
  plot(x, data$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power")
  plot(x, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(x, data$Sub_metering_1, type = "l", ylim = c(0,40), xlab = " ", ylab = "Energy Sub Metering")
  par(new = TRUE)
  plot(x, data$Sub_metering_2, type = "l", col = "red", ylim = c(0,40), xlab = " ", ylab = " ")
  par(new = TRUE)
  plot(x, data$Sub_metering_3, type = "l", col = "blue", ylim = c(0,40), xlab = " ", ylab = " " )
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
  plot(x, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  })
dev.off()