
power.consumption<- read.csv("household_power_consumption.txt",header=T, sep=";",as.is = TRUE)

power.consumption$date <- as.Date(power.consumption$Date, "%d/%m/%Y")
power.consumption$time <- strptime(paste(power.consumption$Date,power.consumption$Time), "%d/%m/%Y %H:%M:%S")

power.consumption$Global_active_power <- as.numeric(power.consumption$Global_active_power)
power.consumption$Global_reactive_power <- as.numeric(power.consumption$Global_reactive_power)
power.consumption$Voltage <- as.numeric(power.consumption$Voltage)
power.consumption$Global_intensity <- as.numeric(power.consumption$Global_intensity)

data.date.range <- function(d,x,y){
  x <- as.Date(x, "%Y-%m-%d")
  y <- as.Date(y, "%Y-%m-%d")
  d[d$date >= x & d$date <= y,]
}

pc <- data.date.range(power.consumption,"2007-02-01","2007-02-02")

#plot(pc$time,pc$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

png("plot2.png",width=480, height=480)
plot(pc$time,pc$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

