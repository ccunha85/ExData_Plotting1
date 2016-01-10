##Code for Reading the Data
fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" ##Reproducible link to the data file
download.file(fileUrl,destfile="powerdata.zip") ##Download the data file
unzip("powerdata.zip") ##unzip the data file
powerdata<-read.table("household_power_consumption.txt",header=TRUE, sep=";",na.strings="?") ##read unzipped file, considering headers available and setting blank values from ? to NA.
subpowerdata<-powerdata[powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007",] ##subsetting the data to only the relevant two dates.

##Code section for plotting
subpowerdata$timestamp<-strptime(paste(subpowerdata$Date, subpowerdata$Time),format="%d/%m/%Y %H:%M:%S") ##create the timestamp column that contains the continuous run of time and date across the days
png("Plot2.png",width = 480, height = 480) ##Creating a graphics device .png with 480x480.
plot(subpowerdata$timestamp,subpowerdata$Global_active_power, type="l",xlab="", ylab= "Global Active Power (killowatts)")##plot time series 
dev.off()##close plot

##end of plot