fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
temp <- tempfile()
download.file(fileUrl, temp)
data <- read.table(unz(temp, 'household_power_consumption.txt'), sep = ';', header = TRUE, stringsAsFactors = FALSE, na.strings = '?')
unlink(temp)
data$Date <- as.Date(data$Date, '%d/%m/%Y')
data$Time <- strptime(paste(data$Date,data$Time), '%Y-%m-%d %H:%M:%S')
data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]
png(file = 'plot2.png')
with(data, plot(Time, Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)'))
dev.off()

