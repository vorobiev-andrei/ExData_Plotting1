## Reading data from dataset file
dat <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", stringsAsFactors = FALSE)

## Converting field Date to date class
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

## Subsetting dataframe to range of desired dates: 2007-02-01 and 2007-02-02
dat <- subset(dat, (dat$Date == "2007-02-01") | (dat$Date == "2007-02-02"))

## Converting field Time to time class
dat$Time <- strptime(paste(dat$Date, dat$Time), format = "%Y-%m-%d %T")

## Open PNG Graphic device
png("plot4.png", width = 480, height = 480)

## Device parameters = 2*2 plot
par(mfcol=c(2,2))

## 1st plot
## Drawing plot (type = lines) to device
with(dat, plot(Time, Global_active_power, type="l", ylab="Global Active Power", xlab=""))


## 2nd plot
## Drawing empty plot
with(dat, plot(Time, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))

## Filling plot with  lines for each field
with(dat, lines(Time, Sub_metering_1, col="black"))
with(dat, lines(Time, Sub_metering_2, col="red"))
with(dat, lines(Time, Sub_metering_3, col="blue"))

## Creating legend of the plot
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## 3rd plot
with(dat, plot(Time, Voltage, type="l", xlab="datetime"))

## 4th plot
with(dat, plot(Time, Global_reactive_power, type="l",  xlab="datetime"))

## Close device
dev.off()
