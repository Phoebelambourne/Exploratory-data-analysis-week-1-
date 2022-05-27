hpc2 <- read.csv("household_power_consumption.txt", 
                 sep = ";", skip = 66637, nrows = 2880, 
                 col.names = c("Date", "Time", "Global_Active_Power", 
                               "global_reactive_power", "voltage", 
                               "global_intensity", "sm1", "sm2", "sm3"))

# change dates and times
hpc2$Date <- dmy(hpc2$Date)
hpc2$Time <- hms(hpc2$Time)
  
hist(hpc2$Global_Active_Power, col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     main = "Global Active Power")

dev.copy(png, "Plot1.png")
dev.off()

