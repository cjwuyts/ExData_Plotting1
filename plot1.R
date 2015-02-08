# read data
energy<-read.table(file ="household_power_consumption.txt",header = T,sep = ";")

# change dates to date format
energy$Date<-as.Date(energy$Date,format="%d/%m/%Y")

# subset 2 days
usedates<-as.Date(c("2007-02-01","2007-02-02"),format="%Y-%m-%d")

energysubset<-energy[energy$Date %in% usedates,]

# change to numeric formats
energysubset$Global_active_power<-as.numeric(as.character(energysubset$Global_active_power))

# open graphics device
png(filename="Plot1.png")

# make the plot
hist(energysubset$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

dev.off()
