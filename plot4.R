data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
data <- data[as.Date(data$Date, format = "%d/%m/%Y") 
             %in% as.Date(c("2007-02-01", "2007-02-02")), ]

times <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480, units="px")

par(mfrow = c(2, 2))

# Plot 1 - Top Left
plot(
    times, 
    data$Global_active_power, 
    xlab = "",
    ylab = "Global Active Power",
    type = "n"
)
lines(times, data$Global_active_power)

# Plot 2 - Top Right
plot(
    times, 
    data$Voltage, 
    xlab = "datetime",
    ylab = "Voltage",
    type = "n"
)
lines(times, data$Voltage)

# Plot 3 - Bottom Left
plot(
    times, 
    data$Sub_metering_1,
    xlab = "",
    ylab = "Energy sub metering",
    type = "n"
)
lines(times, data$Sub_metering_1, col = "black")
lines(times, data$Sub_metering_2, col="red")
lines(times, data$Sub_metering_3, col="blue")
legend(
    x      = "topright", 
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
    col    = c("black", "red","blue"),
    bty    = "n",
    lwd    = 1
)

# Plot 4 - Bottom Right
plot(
    times, 
    data$Global_reactive_power, 
    xlab = "datetime",
    ylab = "Global_reactive_power",
    type = "n"
)
lines(times, data$Global_reactive_power)

dev.off()