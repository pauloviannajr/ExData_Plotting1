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

## Generates the Histogram of the Global Active Power
par(mar = c(5,5,4,2), mfrow = c(1,1))
par(cex=0.7)
hist(dados$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", col = 498)
dev.copy(png, file = "plot1.png") 
dev.off()