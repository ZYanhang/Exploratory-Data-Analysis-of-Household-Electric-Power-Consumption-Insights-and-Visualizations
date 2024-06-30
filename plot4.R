data<-read.table("C:/Users/ayoub/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE)
data<- data %>% mutate(Date= as.Date(Date, format="%d/%m/%Y"))
data <- data %>% mutate(DateTime = strptime(paste(Date, Time), format = "%Y-%m-%d %H:%M:%S"))
data<- data %>% filter(Date=="2007-02-01" | Date=="2007-02-02")
data<- data %>% mutate(Global_active_power= as.numeric(Global_active_power))
par(mfcol=c(2,2))
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(data$DateTime, data$Sub_metering_1, type='l', xlab = "", ylab = "Energy sub metering", col="Black")
lines(data$DateTime, data$Sub_metering_2, col="Red")
lines(data$DateTime, data$Sub_metering_3, col="Blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, cex=0.6, pt.cex=0.6, box.lwd=0.5, inset=c(-0.2,0))
plot(data$DateTime, data$Voltage, type="l", xlab="Daletime", ylab="Voltage")

plot(data$DateTime, data$Global_reactive_power, type="l", xlab="Global_reactive_power", ylab="Voltage")

dev.copy(png, "plot4.png", width=408, height=408)
dev.off()
