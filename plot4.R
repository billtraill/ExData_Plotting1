
power.consumption<- read.csv("household_power_consumption.txt",header=T, sep=";",as.is = TRUE)

power.consumption$date <- as.Date(power.consumption$Date, "%d/%m/%Y")
power.consumption$time <- strptime(paste(power.consumption$Date,power.consumption$Time), "%d/%m/%Y %H:%M:%S")

power.consumption$Global_active_power <- as.numeric(power.consumption$Global_active_power)
power.consumption$Global_reactive_power <- as.numeric(power.consumption$Global_reactive_power)
power.consumption$Voltage <- as.numeric(power.consumption$Voltage)
power.consumption$Global_intensity <- as.numeric(power.consumption$Global_intensity)
power.consumption$Sub_metering_1 <- as.numeric(power.consumption$Sub_metering_1)
power.consumption$Sub_metering_2 <- as.numeric(power.consumption$Sub_metering_2)
power.consumption$Sub_metering_3 <- as.numeric(power.consumption$Sub_metering_3)

data.date.range <- function(d,x,y){
  x <- as.Date(x, "%Y-%m-%d")
  y <- as.Date(y, "%Y-%m-%d")
  d[d$date >= x & d$date <= y,]
}

pc <- data.date.range(power.consumption,"2007-02-01","2007-02-02")


png("plot4.png",width=480, height=480)
par(mfrow=c(2,2))
plot(pc$time,pc$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(pc$time,pc$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(pc$time,pc$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(pc$time,pc$Sub_metering_2,col="red")
lines(pc$time,pc$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       bty = "n")
plot(pc$time,pc$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()

