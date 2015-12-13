## setwd(".\\AnaliseExploratoriaDados\\Project1")
## Please, place the unzziped household_power_consumption.txt at your working 
## directory before running this script


## reads only the 2880 lines corresponding to the period from 2007/02/01 to
## 2007/02/02
dados <- read.table("household_power_consumption.txt", sep = ";", header = F, 
                    na.strings = "?", skip = 66637, nrows = 2880)

## reads the column names
colnames(dados) <- colnames(read.table("household_power_consumption.txt", sep = ";", 
                                       header = T, nrows = 1))

## Creates the datetime variable converting the Date and Time variables to POSIXlt format
dados$datetime <- strptime(paste(dados$Date,dados$Time),"%d/%m/%Y %H:%M:%S")
##dados$Date <- as.Date(dados$Date,"%d/%m/%Y")
##dados$Time <- strptime(dados$Time,"%H:%M:%S")
##dados$weekday <- weekdays.POSIXt(dados$datetime)

## Adjusts the weekdays for English, instead of portuguese
Sys.setlocale("LC_TIME", "C")

## Plots the graphic
par(mar = c(5,5,4,3), mfrow = c(1,1))
par(cex=0.7)
with(dados,{
    plot(datetime, Sub_metering_1, type = "l", 
                 ylab = "Energy sub metering", xlab = "")
    points(datetime, Sub_metering_2, type = "l", 
                 xlab = "", col = "red")
    points(datetime, Sub_metering_3, type = "l", 
                 xlab = "", col = "blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1  ","Sub_metering_2  ","Sub_metering_3  "), 
           cex = 0.8)})

dev.copy(png, file = "plot3.png") 
dev.off()

## Restore portuguese weekdays
Sys.setlocale("LC_TIME", "")
