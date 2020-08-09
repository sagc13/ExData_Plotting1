#Plot 4
library(dplyr)
library(lubridate)

#Download File
fileZIP <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileZIP, destfile = "Dataset.zip")
unzip("Dataset.zip")

#Filtering data based on dates provided
Dataset <- read.table("household_power_consumption.txt",header= TRUE,sep=";",na.strings="?")
Dataset$Date <- as.Date(Dataset$Date,format="%d/%m/%Y")
Data <- filter(Dataset, Date >= "2007-02-01" & Date <= "2007-02-02")

#Generating png and plot
png("plot4.png", width = 480, height = 480)
datetime <- paste(as.Date(Data$Date), Data$Time)
Data$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2))
# First plot
plot(Data$Datetime,Data$Global_active_power,  type="l",ylab="Global Active Power", xlab="")
# Second plot
plot(Data$Datetime,Data$Voltage,type="l",ylab="Voltage", xlab="datetime")
# Third Plot
plot(Data$Datetime,Data$Sub_metering_1,ylab="Energy sub metering", xlab="", type="l", col="black")
points(Data$Datetime,Data$Sub_metering_2, col="red", type="l")
points(Data$Datetime,Data$Sub_metering_3, col="blue", type="l")
legend("topright",  bty="n",col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Fourth Plot
plot(Data$Datetime,Data$Global_reactive_power,type="l", xlab="datetime", ylab="Global_reactive_power",breaks=100)
dev.off()
