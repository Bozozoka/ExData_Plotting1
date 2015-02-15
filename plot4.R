
# Load the data

cc = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
dat = read.table("household_power_consumption.txt", nrows=2075259, sep=";", header=TRUE, na.strings="?")

# Get only the interesting dates
dat1 = subset(dat, Date=="1/2/2007" | Date=="2/2/2007")

# Combine date and time into one variable
dat2 = transform(dat1, datetime=strptime(paste(dat1$Date, dat1$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), Date=NULL, Time=NULL)

# Draw the histogram
png("plot4.png", width=504, height=504,units="px",bg="transparent")

# Divide into 4 regions
par(mfrow=c(2,2))

# Do plot2

plot(x=dat2$datetime, y=dat2$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")

# Voltage graph

plot(x=dat2$datetime, y=dat2$Voltage, xlab="datetime", ylab="Voltage", type="l")

# Do plot3

plot(x=dat2$datetime, y=dat2$Sub_metering_1, type="l", ylim=range(c(0,max(dat2$Sub_metering_1))), xlab="", ylab="Energy sub metering")
par(new=TRUE)
plot(x=dat2$datetime, y=dat2$Sub_metering_2, type="l", ylim=range(c(0,max(dat2$Sub_metering_1))), xlab="", ylab="Energy sub metering", col="red")
par(new=TRUE)
plot(x=dat2$datetime, y=dat2$Sub_metering_3, type="l", ylim=range(c(0,max(dat2$Sub_metering_1))), xlab="", ylab="Energy sub metering", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"), bty="n")

# Global reactive power graph

plot(x=dat2$datetime, y=dat2$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()




