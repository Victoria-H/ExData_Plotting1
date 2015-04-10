## plot1


## read in data (only those rows corresponding to Feb1st and Feb2nd are read in)
library(R.utils)
index<-readTableIndex("household_power_consumption.txt",indexColumn=1, header=TRUE, sep=";")
rows<-which(index=="1/2/2007" | index=="2/2/2007")
df <- readTable("household_power_consumption.txt",header=TRUE, sep=";", rows=rows, check.names=TRUE, colClasses = c("factor", "character", rep("numeric",7)))

## required plot to png
png(file="plot1.png", width=480, height=480)
with(df, hist(Global_active_power, col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()

