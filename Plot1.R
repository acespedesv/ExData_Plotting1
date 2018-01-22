
#Reading and filtering Data
pc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = c("?"))

#Convert to Datetime
pc$Date <- as.Date(pc$Date, "%d/%m/%Y")

#Filtering Data
pc <- subset(pc,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
pc$DateTime <- as.POSIXct(paste(pc$Date, pc$Time), format="%Y-%m-%d %H:%M:%S")

#Temporal Variable
plot1 <- pc$Global_active_power

#Histogram - Plot1
hist(plot1, col="red", main="Global Active Power", ylab="Frequency",
     xlab="Global Active Power (kilowats)",  
)

