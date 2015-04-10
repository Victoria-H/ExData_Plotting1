## plot2


## read in data (only those rows corresponding to Feb1st and Feb2nd are read in)
library(R.utils)
index<-readTableIndex("household_power_consumption.txt",indexColumn=1, header=TRUE, sep=";")
rows<-which(index=="1/2/2007" | index=="2/2/2007")
df <- readTable("household_power_consumption.txt",header=TRUE, sep=";", rows=rows, check.names=TRUE, colClasses = c("factor", "character", rep("numeric",7)))

## adds another column with correct date time format
df$datetime<-strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")

## required plot to png
png(file="plot2.png", width=480, height=480)
with(df, plot(y=Global_active_power, x=datetime, type='l', xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
