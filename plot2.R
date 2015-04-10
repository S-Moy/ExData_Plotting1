## Function plot2 to plot Global Active Power
plot2 <- function() {

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
##Create plot of Global Active Power vs Time, and store to .png file 
png(filename="plot2.png",width=480,height=480)
plot(strptime(paste(dft$Date,dft$Time),"%d/%m/%Y %H:%M:%S"),dft$Global_active_power,typ="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()

}  ##End function





