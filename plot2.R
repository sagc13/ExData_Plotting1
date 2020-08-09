#Plot 2
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
png("plot2.png", width = 480, height = 480)
datetime <- paste(as.Date(Data$Date), Data$Time)
Data$Datetime <- as.POSIXct(datetime)
plot(Data$Datetime,Data$Global_active_power,  type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
