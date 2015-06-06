#Exploratory Data Analysis
#Project 1
getData <- function() {
	#Step 1: Load the data into a dataframe
		if (!file.exists("household_power_consumption.txt")) {
			url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
               download.file(url,"household_power_consumption.zip")
               unzip("household_power_consumption.zip","household_power_consumption.txt")
		}
		df <- data.frame(read.table(file="household_power_consumption.txt",header=TRUE,sep=";"))

	#Step 2: Clean the data
		df$Date_Time<-strptime(paste(df$Date,df$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")          
		df <- subset(df,Date_Time >= as.POSIXlt("2007-02-01 00:00:00") & Date_Time <= as.POSIXlt("2007-02-02 23:59:59"))

		df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
		return(df)
}    
plot1 <- function(df,getData=FALSE) {
	#Get Data if needed
		if (getData) {df <- getData()}
    #Plot 1 - a Histogram of Global Active Power
		hist(df$Global_active_power, 
			xlab = "Global Active Power (kilowatts)", 
			col = "red",
			angle = 60,
			main = "Global Active Power")
}
plot2 <- function(df,getData=FALSE) {
	#Get Data if needed
		if (getData) {df <- getData()}
    #Plot 2 - a line plot of Global Active Power over time
		plot(df$Date_Time,df$Global_active_power,
			type = "l",
			xlab = " " ,
			ylab = "Global Active Power (kilowatts)")
}
plot3 <- function(df,getData=FALSE) {
	#Get Data if needed
		if (getData) {df <- getData()}		
    #Plot 3 - a line plot showing the all three sub meters over time on the same plot
		plot(df$Date_Time,df$Sub_metering_1,
			type = "l",
			xlab = " ",
			ylab = "Energy sub metering",
			col = "black")
		lines(df$Date_Time,df$Sub_metering_2,
			col = "red")
		lines(df$Date_Time,df$Sub_metering_3,
			col = "blue")
		legend(x="topright",y=NULL,
			legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
			lty = c(1,1,1),
			lwd = c(2.25,2.25,2.25),
			col = c("black","red","blue"))
}
plot4 <- function(df,getData=FALSE) {
	#Get Data if needed
		if (getData) {df <- getData()}		
    #Plot 4 - series of 4 plots
    par(mfrow=c(2,2))
    
	##Plot 1 - Upper Left - G.A.P. over time
    plot1(df)
    
    ##Plot 2 - Upper Right - Voltage over time
    plot(df$Date_Time,df$Voltage,
         type = "l",
         xlab = "datetime",
         ylab = "Voltage")
    
    ##Plot 3 - Lower Left - Sub Meter Tracking
    plot3(df)
    
    ##Plot 4 - Lower Right - Global Reactive Power over time
    plot(df$Date_Time,df$Global_reactive_power,
		type = "l",
		xlab = "datetime",
		ylab = "Global_reactive_power")
}
doItAll <- function() {
	print("Fetching and Cleaning Data",quote=FALSE)
	
	df <- getData()
	
	print("Making Plot 1",quote=FALSE)
	png(file="Plot1.png"); plot1(df); dev.off()
	
	print("Making Plot 2",quote=FALSE)
	png(file="Plot2.png"); plot2(df); dev.off()
	
	print("Making Plot 3",quote=FALSE)
	png(file="Plot3.png"); plot3(df); dev.off()
	
	print("Making Plot 4",quote=FALSE)
	png(file="Plot4.png"); plot4(df); dev.off()
}
