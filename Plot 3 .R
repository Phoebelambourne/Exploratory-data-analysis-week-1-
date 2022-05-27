hpc <- read.csv("household_power_consumption.txt", 
                sep = ";", skip = 66637, nrows = 2880, 
                col.names = c("Date", "Time", "Global_Active_Power", 
                              "global_reactive_power", "voltage", 
                              "global_intensity", "sm1", "sm2", "sm3"))

hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(hpc$Date), hpc$Time)
hpc$Datetime <- datetime
hpc$Datetime <- as.POSIXct(datetime)

plot(hpc$Datetime, hpc$sm1, type = "l", ylab = "Energy sub metering")
lines(hpc$Datetime, hpc$sm2, type = "l", col = "red")
lines(hpc$Datetime, hpc$sm3, type = "l", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, cex = 0.8)

dev.copy(png, "Plot3.png")
dev.off()
