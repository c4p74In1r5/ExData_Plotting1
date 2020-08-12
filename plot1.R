data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
data <- data[as.Date(data$Date, format = "%d/%m/%Y") 
              %in% as.Date(c("2007-02-01", "2007-02-02")), ]

png("plot1.png", width=480, height=480, units="px")

hist(
    data1$Global_active_power, 
    breaks = 12, 
    col    = "red", 
    xlab   = "Global Active Power (kilowatts)", 
    main   = "Global Active Power"
)

dev.off()