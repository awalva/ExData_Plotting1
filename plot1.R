## read in data, using skip and nrows args to only get what we want
data <- read.table(file = "household_power_consumption.txt", 
                   sep = ";", 
                   skip = 66637, 
                   nrows = 2880)

## name columns
colnames(data) <- c("Date", "Time", "Global_active_power", 
                    "Global_reactive_power", "Voltage", 
                    "Global_intensity", "Sub_metering_1", 
                    "Sub_metering_2", "Sub_metering_3")

## make histogram
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

## copy plot to png device
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()
