
#Reading and filtering Data
pc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = c("?"))

#Convert to Datetime
pc$Date <- as.Date(pc$Date, "%d/%m/%Y")

#Filtering Data
pc <- subset(pc,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
pc$DateTime <- as.POSIXct(paste(pc$Date, pc$Time), format="%Y-%m-%d %H:%M:%S")

#Temporal Variable
plot2 <- pc$Global_active_power ~ pc$DateTime

#Plot2
plot(plot2, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")
