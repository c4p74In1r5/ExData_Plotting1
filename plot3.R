data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
data <- data[as.Date(data$Date, format = "%d/%m/%Y") 
             %in% as.Date(c("2007-02-01", "2007-02-02")), ]

times <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480, units="px")

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
    x = "topright", 
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
    col=c("black", "red","blue"),
    lwd = 1
)

dev.off()