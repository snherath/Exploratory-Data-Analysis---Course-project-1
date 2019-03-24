# Reading, naming and subsetting power consumption data
hhpower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(hhpower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subhhpower <- subset(hhpower,hhpower$Date=="1/2/2007" | hhpower$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subhhpower$Date <- as.Date(subhhpower$Date, format="%d/%m/%Y")
subhhpower$Time <- strptime(subhhpower$Time, format="%H:%M:%S")
subhhpower[1:1440,"Time"] <- format(subhhpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subhhpower[1441:2880,"Time"] <- format(subhhpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#set png
png("plot2.png", width=480, height=480)

# calling the basic plot function
plot(subhhpower$Time,as.numeric(as.character(subhhpower$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# annotating graph
title(main="Global Active Power Vs Time")

dev.off()