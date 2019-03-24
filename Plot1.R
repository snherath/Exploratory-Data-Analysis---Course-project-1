#load data set
setwd("D:/Work Files")
hhpower <- read.table("household_power_consumption.txt",skip=1,sep=";")

#Naming and subsetting data
names(hhpower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

subhhpower <- subset(hhpower,hhpower$Date=="1/2/2007" | hhpower$Date =="2/2/2007")

#plot1 for png
png("plot1.png", width=480, height=480)

#plot histogram
hist(as.numeric(as.character(subhhpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

#Giving graph name
title(main="Global Active Power")

dev.off()