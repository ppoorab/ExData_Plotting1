ihpc=read.table("household_power_consumption.txt",header=T,na.strings = "?",sep=";",stringsAsFactors = FALSE)
str(ihpc)
ihpc$Date=as.Date(ihpc$Date,format="%d/%m/%Y")
str(ihpc)
ihpc=subset(ihpc,Date >="2007-02-01" & Date<="2007-02-02")
str(ihpc)
ihpc$datetime <- strptime(paste(ihpc$Date,ihpc$Time),"%Y-%m-%d %H:%M:%S",tz="")
str(ihpc)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

with(ihpc,plot(datetime,Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab=""))
with(ihpc,lines(datetime,Global_active_power))

with(ihpc,plot(datetime,Voltage,type="n"))
with(ihpc,lines(datetime,Voltage))

with(ihpc,plot(datetime,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
with(ihpc,lines(datetime,Sub_metering_2,col="red"))
with(ihpc,lines(datetime,Sub_metering_3,col="blue"))
with(ihpc,lines(datetime,Sub_metering_1,col="black"))
legend("topright",pch="_",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.8,bty="n")

with(ihpc,plot(datetime,Global_reactive_power,type="n"))
with(ihpc,lines(datetime,Global_reactive_power))