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
png(filename = "plot2.png", width = 480, height = 480)
plot(x, data$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")
dev.off()

