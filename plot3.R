#Plot 3
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
png("plot3.png", width = 480, height = 480)
datetime <- paste(as.Date(Data$Date), Data$Time)
Data$Datetime <- as.POSIXct(datetime)
plot(Data$Datetime,Data$Sub_metering_1,ylab="Energy sub metering", xlab="", type="l", col="black")
points(Data$Datetime,Data$Sub_metering_2, col="red", type="l")
points(Data$Datetime,Data$Sub_metering_3, col="blue", type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
       