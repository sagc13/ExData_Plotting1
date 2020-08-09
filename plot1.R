#Plot 1
library(dplyr)
library(lubridate)

fileZIP <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileZIP, destfile = "Dataset.zip")
unzip("Dataset.zip")

Dataset <- read.table("household_power_consumption.txt",header= TRUE,sep=";",na.strings="?")
Dataset$Date <- as.Date(Dataset$Date,format="%d/%m/%Y")
Data <- filter(Dataset, Date >= "2007-02-01" & Date <= "2007-02-02")

png("plot1.png", width = 480, height = 480)
hist(Data$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab = "Frecuency")
dev.off()
