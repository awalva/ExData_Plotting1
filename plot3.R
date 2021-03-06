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


## open pgn device, create file of correct width and heigt
png(filename = "plot3.png", width = 480, height = 480)

## make plot of type `l`, add lines for other sub_metering vars
with(data, plot(dateTime, Sub_metering_1, type="l", xlab="", 
                ylab="Energy sub metering"))
with(data, lines(dateTime, Sub_metering_2, col="red"))
with(data, lines(dateTime, Sub_metering_3, col="blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = 
             c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##close png device
dev.off()
