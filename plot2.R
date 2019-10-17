## Reading data from dataset file
dat <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", stringsAsFactors = FALSE)

## Converting field Date to date class
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

## Subsetting dataframe to range of desired dates: 2007-02-01 and 2007-02-02
dat <- subset(dat, (dat$Date == "2007-02-01") | (dat$Date == "2007-02-02"))

## Converting field Time to time class
dat$Time <- strptime(paste(dat$Date, dat$Time), format = "%Y-%m-%d %T")

## Open PNG Graphic device
png("plot2.png", width = 480, height = 480)

## Drawing plot (type = lines) to device
with(dat, plot(Time, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

## Close device
dev.off()
