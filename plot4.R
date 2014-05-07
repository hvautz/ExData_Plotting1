## plot4
file <- "household_power_consumption.txt"
# read file
data <- read.table(file, header = T, sep = ";", na.strings = "?", stringsAsFactors=F)
# create date/time col of date and time
data$date_time <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
# convert date col to date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#subset data
sdata <- data[with(data, Date == "2007-02-01" | Date == "2007-02-02"), ]

# open png-file
png(file="plot4.png", width = 480, height=480, bg="transparent")
par(mfrow = c(2,2))

# set locale to english
cur_loc <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")

plot(sdata$date_time           # x axis
   , sdata$Global_active_power # y axis
   , type = "l"                # line type
   , xlab = "", ylab = "Global Active Power" # labels
)

plot(sdata$date_time           # x axis
   , sdata$Voltage             # y axis
   , type = "l"                # line type
   , xlab = "datetime", ylab = "Voltage" # labels
)

plot(sdata$date_time           # x axis
   , sdata$Sub_metering_1      # y axis
   , type = "n"
   , xlab = "", ylab = "Energy sub metering"
)

lines(sdata$date_time           # x axis
   , sdata$Sub_metering_1      # y axis
   , col = "black"
)

lines(sdata$date_time           # x axis
   , sdata$Sub_metering_2      # y axis
   , col = "red"
)

lines(sdata$date_time           # x axis
   , sdata$Sub_metering_3      # y axis
   , col = "blue"
)

legend("topright"
   , c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
   , lty = c(1,1,1)
   , col = c("black", "red", "blue")
   , bty = "n"  # no border
)

plot(sdata$date_time           # x axis
   , sdata$Global_reactive_power  # y axis
   , type = "l"                # line type
   , xlab = "datetime", ylab = "Global_reactive_power" # labels
)
dev.off()

# set locale back to default
Sys.setlocale("LC_TIME", cur_loc)
