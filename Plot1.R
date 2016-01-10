##Code for Reading the Data
fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" ##Reproducible link to the data file
download.file(fileUrl,destfile="powerdata.zip") ##Download the data file
unzip("powerdata.zip") ##unzip the data file
powerdata<-read.table("household_power_consumption.txt",header=TRUE, sep=";",na.strings="?") ##read unzipped file, considering headers available and setting blank values from ? to NA.
subpowerdata<-powerdata[powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007",] ##subsetting the data to only the relevant two dates.

##Code section for plotting
png("Plot1.png",width = 480, height = 480) ##Creating a graphics device .png with 480x480.
hist(subpowerdata$Global_active_power, col="red", main = "Global Active Power", 
     xlab= "Global Active Power (killowatts)") ##histogram of Global Active Power, color red, title added and X label changed.
dev.off() ##closing graphics device .png.

##end plot
