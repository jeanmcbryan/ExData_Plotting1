## Import the data
datafull<-read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

## Subset just the data from 1st Feb 2007 and 2nd Feb 2007
data1st<-datafull[which(datafull$Date == "1/2/2007"), ]
data2nd<-datafull[which(datafull$Date == "2/2/2007"), ]
data<-data.frame()
data<-rbind(data, data1st, data2nd)

## plot 1st histogram of global active power with labels and save as png
png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()