## plot4


## read in data (only those rows corresponding to Feb1st and Feb2nd are read in)
library(R.utils)
index<-readTableIndex("household_power_consumption.txt",indexColumn=1, header=TRUE, sep=";")
rows<-which(index=="1/2/2007" | index=="2/2/2007")
df <- readTable("household_power_consumption.txt",header=TRUE, sep=";", rows=rows, check.names=TRUE, colClasses = c("factor", "character", rep("numeric",7)))

## adds another column with correct date time format
df$datetime<-strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")



## required plot to png
png(file="plot4.png", width=480, height=480)

par(mfrow=c(2,2)) ## 2x2 grid for plot

## topleft
with(df, plot(y=Global_active_power, x=datetime, type='l', xlab="", ylab="Global Active Power (kilowatts)")) 

## top right
with(df, plot(y=Voltage, x=datetime, type="l"))

## bottom left
with(df, plot(x = datetime, y=Sub_metering_1, type = 'l', xlab="", ylab="Energy sub metering"))
lines(x=df$datetime, y=df$Sub_metering_2, col="red")
lines(x=df$datetime, y=df$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),bty="n", lty=c(1,1,1), col=c("black","red","blue"))

## bottom right
with(df, plot(y=Global_reactive_power, x=datetime, type="l")) 

dev.off()





