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


## Adjusts the weekdays for English, instead of default
Sys.setlocale("LC_TIME", "C")

## Plots the graphic to a png file
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12)
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
dev.off()

## Restore default weekdays
Sys.setlocale("LC_TIME", "")
