##Function plot1 to plot Global Active Power histogram
plot1 <- function() {

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
##Create plot of Global Active Power, and store to .png file 
png(filename="plot1.png",width=480,height=480)
hist(dft$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()

} ## End function








