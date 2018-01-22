
#Reading and filtering Data
pc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = c("?"))

#Convert to Datetime
pc$Date <- as.Date(pc$Date, "%d/%m/%Y")

#Filtering Data
pc <- subset(pc,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
pc$DateTime <- as.POSIXct(paste(pc$Date, pc$Time), format="%Y-%m-%d %H:%M:%S")

#Temporal Variables

plot3_1 <- pc$Sub_metering_1 ~ pc$DateTime
plot3_2 <- pc$Sub_metering_2 ~ pc$DateTime
plot3_3 <- pc$Sub_metering_3 ~ pc$DateTime

#Plot 3
plot(plot3_1, type = "l",ylab = "Energy Sub Metering", xlab = "")
lines(plot3_2, col="red", ylab = "Energy Sub Metering", xlab = "")
lines(plot3_3, col="blue", ylab = "Energy Sub Metering", xlab = "")
legend( x="topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
        col=c("black","red", "blue"), lwd=1, lty=c(1,2), pch=c(NA,NA) )


