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

## need to convert Date column from factor to a date using as.Date()
data$"Date" <- as.Date(data$"Date", "%d/%m/%Y")

## then use strptime() with `format` argument???
dateTime <- strptime(paste(data$"Date", data$"Time"), "%Y-%m-%d %H:%M:%S")

## bind new `dateTime` column to data frame
data <- cbind(data, dateTime)

## make plot of type `l`
with(data, plot(dateTime,Global_active_power, type="l", xlab=""))

## copy plot to png device
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()
