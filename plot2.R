data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
data <- data[as.Date(data$Date, format = "%d/%m/%Y") 
             %in% as.Date(c("2007-02-01", "2007-02-02")), ]

times <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480, units="px")

plot(
    times, 
    data$Global_active_power, 
    xlab = "",
    ylab = "Global Active Power (kilowatts)",
    type = "n"
)
lines(times, data$Global_active_power)

dev.off()