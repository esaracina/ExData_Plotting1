## Read data
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

## Subset data by date
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

## Convert date and time variables to Date/Time classes
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

## Launch graphics device
png(file = "plot1.png", width=480, height=480)

## Initialize and annotate plot
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

## Close graphics device
dev.off()