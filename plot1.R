## Reading data from dataset file
dat <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", stringsAsFactors = FALSE)

## Converting field Date to date class
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

## Subsetting dataframe to range of desired dates: 2007-02-01 and 2007-02-02
dat <- subset(dat, (dat$Date == "2007-02-01") | (dat$Date == "2007-02-02"))

## Converting field Time to time class
dat$Time <- strptime(paste(dat$Date, dat$Time), format = "%Y-%m-%d %T")

## Open PNG Graphic device
png("plot1.png", width = 480, height = 480)

## Drawing histogram to device
hist(dat$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## Close device
dev.off()
