## plot1
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
png(file="plot1.png", width = 480, height=480, bg="transparent")

# set locale to english
cur_loc <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")

# plot histogram
hist(sdata$Global_active_power
   , xlab = "Global Active Power (kilowatts)"
   , main = "Global Active Power"
   , col ="red")
# close file and write plot to disk
dev.off()

# set locale back to default
Sys.setlocale("LC_TIME", cur_loc)

