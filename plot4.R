##Function plot4 to plot multiple plots
plot4 <- function() {

library(ggplot2)
##Download data file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile="household_power_consumption.zip",method="curl",extra="-k")
##Unzip into household_power_consumption.txt
unzip("household_power_consumption.zip") 
##Read data file into data.frame df
df <- read.csv("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",as.is=TRUE)
## Only want data between 2007-02-01 and 2007-02-02
df1 <- subset(df,df$Date=="1/2/2007")
df2 <- subset(df,df$Date=="2/2/2007")
dft <- rbind(df1,df2)

##### Open png grapic device to write 4 muliple plots in a 2x2 grid
png(filename="plot4.png",width=480,height=480)
par(mfrow = c(2,2))

##### Plot#1 of Global Active Power
plot(strptime(paste(dft$Date,dft$Time),"%d/%m/%Y %H:%M:%S"),dft$Global_active_power,typ="l",ylab="Global Active Power",xlab="")

##### Plot#2 of Voltage
plot(strptime(paste(dft$Date,dft$Time),"%d/%m/%Y %H:%M:%S"),dft$Voltage,typ="l",ylab="Voltage",xlab="datetime")

##### Plot#3 of Energy Sub Energy vs Time, and store to .png file #####
plot(strptime(paste(dft$Date,dft$Time),"%d/%m/%Y %H:%M:%S"),dft$Sub_metering_1,typ="l",ylab="",xlab="",ylim=c(0,40),col="black")
par(new=TRUE)
plot(strptime(paste(dft$Date,dft$Time),"%d/%m/%Y %H:%M:%S"),dft$Sub_metering_2,typ="l",ylab="",xlab="",ylim=c(0,40),col="red")
par(new=TRUE)
plot(strptime(paste(dft$Date,dft$Time),"%d/%m/%Y %H:%M:%S"),dft$Sub_metering_3,typ="l",ylab="Energy sub metering",xlab="",ylim=c(0,40),col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1, bty="n")
par(new=FALSE)

##### Plot#4 of Global Reactive Power
plot(strptime(paste(dft$Date,dft$Time),"%d/%m/%Y %H:%M:%S"),dft$Global_reactive_power,typ="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()

} ## end function




