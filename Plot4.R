
#Reading and filtering Data
pc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = c("?"))

#Convert to Datetime
pc$Date <- as.Date(pc$Date, "%d/%m/%Y")

#Filtering Data
pc <- subset(pc,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
pc$DateTime <- as.POSIXct(paste(pc$Date, pc$Time), format="%Y-%m-%d %H:%M:%S")

#Temporal Variables
plot4_1 <- pc$Global_active_power ~ pc$DateTime
plot4_2 <- pc$Voltage ~ pc$DateTime

plot4_3 <- pc$Sub_metering_1 ~ pc$DateTime
plot4_4 <- pc$Sub_metering_2 ~ pc$DateTime
plot4_5 <- pc$Sub_metering_3 ~ pc$DateTime

plot4_6 <- pc$Global_reactive_power ~ pc$DateTime

#Plot 4
par(mfrow=c(2,2))
plot(plot4_1, type = "l", ylab="Global Active Power", xlab="",  )
plot(plot4_2, type = "l", ylab="Voltage", xlab="datetime",  )
plot(plot4_3, type = "l",ylab = "Energy Sub Metering", xlab = "")
lines(plot4_4, col="red", ylab = "Energy Sub Metering", xlab = "")
lines(plot4_5, col="blue", ylab = "Energy Sub Metering", xlab = "")
legend( x="topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
        col=c("black","red", "blue"), lwd=1, lty=c(1,2), pch=c(NA,NA) )
plot(plot4_6, type = "l", ylab="Global Reactive Power", xlab="datetime",  )