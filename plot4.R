# read data
energy<-read.table(file ="household_power_consumption.txt",header = T,sep = ";")

# change dates to date format
energy$Date<-as.Date(energy$Date,format="%d/%m/%Y")

# subset 2 days
usedates<-as.Date(c("2007-02-01","2007-02-02"),format="%Y-%m-%d")

energysubset<-energy[energy$Date %in% usedates,]

# make numeric
energysubset$Global_active_power<-as.numeric(as.character(energysubset$Global_active_power))
energysubset$Sub_metering_1<-as.numeric(as.character(energysubset$Sub_metering_1))
energysubset$Sub_metering_2<-as.numeric(as.character(energysubset$Sub_metering_2))
energysubset$Sub_metering_3<-as.numeric(as.character(energysubset$Sub_metering_3))
energysubset$Voltage<-as.numeric(as.character(energysubset$Voltage))
energysubset$Global_reactive_power<-as.numeric(as.character(energysubset$Global_reactive_power))

# add time
time<-as.POSIXlt(paste(as.character(energysubset$Date),as.character(energysubset$Time)),format="%Y-%m-%d %H:%M:%S")

# open graphics device
png(filename="Plot4.png")

par(mfrow=c(2,2))
plot(time,energysubset$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",main="")
plot(time,energysubset$Voltage,type="l",xlab="datetime",ylab="Voltage",main="")
plot(time,energysubset$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",main="")
lines(time,energysubset$Sub_metering_2,col="red")
lines(time,energysubset$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
plot(time,energysubset$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power",main="")

par(mfrow=c(1,1))

dev.off()