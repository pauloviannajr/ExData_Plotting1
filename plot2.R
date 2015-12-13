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


## Adjusts the weekdays for English, instead of portuguese
Sys.setlocale("LC_TIME", "C")

## Plots the graphic to a png file
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12)
with(dados, plot(datetime, Global_active_power, type = "l", 
                 ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()

## Restore portuguese weekdays
Sys.setlocale("LC_TIME", "")


