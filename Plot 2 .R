# Plot 2 

hpc <- read.csv("household_power_consumption.txt", 
                 sep = ";", skip = 66637, nrows = 2880, 
                 col.names = c("Date", "Time", "Global_Active_Power", 
                               "global_reactive_power", "voltage", 
                               "global_intensity", "sm1", "sm2", "sm3"))

hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(hpc$Date), hpc$Time)
hpc$Datetime <- datetime
hpc$Datetime <- as.POSIXct(datetime)


plot(hpc$Datetime, hpc$Global_Active_Power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, "Plot2.png")
dev.off()
