
# Load the data

cc = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
dat = read.table("household_power_consumption.txt", nrows=2075259, sep=";", header=TRUE, na.strings="?")

# Get only the interesting dates
dat1 = subset(dat, Date=="1/2/2007" | Date=="2/2/2007")

# Draw the histogram
png("plot1.png", width=504, height=504,units="px",bg="transparent")
hist(dat1$Global_active_power, main="Global Active Power",xlab="Global Active Power(kilowatts)",col="red")
dev.off()

