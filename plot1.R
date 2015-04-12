setwd("C:/Users/Administrator/Desktop/Coursera")
if(!file.exists("./Exploratory Data Analysis")){
    dir.create("./xploratory Data Analysis")}
    if(!file.exists("./xploratory Data Analysis/exdata_data-household_power_consumption.zip")) {
        temp <- "./xploratory Data Analysis/exdata_data-household_power_consumption.zip"
        fileurl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_        power_consumption.zip"
        download.file(fileurl,destfile=temp)
        file <- unzip(zipfile=temp, exdir="./xploratory Data Analysis")
        rm(temp)
}
dat <- read.table(file, header=TRUE, sep=';', na.strings="?")
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")
datsubSet <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]
### datsubSet <- dat[(dat$Date=="2007-02-01") | (dat$Date=="2007-02-02"),]
globalActivePower <- as.numeric(datsubSet$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
