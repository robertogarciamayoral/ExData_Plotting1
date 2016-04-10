fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
temp <- tempfile()
download.file(fileUrl, temp)
data <- read.table(unz(temp, 'household_power_consumption.txt'), sep = ';', header = TRUE, stringsAsFactors = FALSE, na.strings = '?')
unlink(temp)
data$Date <- as.Date(data$Date, '%d/%m/%Y')
data$Time <- strptime(paste(data$Date,data$Time), '%Y-%m-%d %H:%M:%S')
data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]

png(file = 'plot4.png')
par(mfcol = c(2,2))

with(data, plot(Time, Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)'))

with(data, plot(Time, Sub_metering_1, type = 'l', col = 'grey', ylab = 'Global Active Power (kilowatts)'))
with(data, points(Time, Sub_metering_2, type = 'l', col = 'red'))
with(data, points(Time, Sub_metering_3, type = 'l', col = 'blue'))
legend('topright', col = c('grey', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = c(1,1))

with(data, plot(Time, Voltage, type = 'l'))

with(data, plot(Time, Global_reactive_power, type = 'l'))

dev.off()

