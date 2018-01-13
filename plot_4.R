##

# set working directory
wd <-  "/Users/muhammadhamidahmed/Desktop/Coursera/Explotory data analysis/"
setwd(wd)

# reading the date as a table
f_n = "household_power_consumption.txt"  
p_d <- read.table(f_n, header = TRUE, sep = ";")

# changing date formate

p_d$Date <- as.Date(p_d[,1, drop = FALSE][[1]],format = "%d/%m/%Y")

# Truncate data to dates 2007-02-01 and 2007-02-02.

p_d_truncated <- subset(p_d, Date == "2007-02-01" | Date == "2007-02-02")
rm(p_d)

# changing the second column to time formate
x <- paste(p_d_truncated$Date, p_d_truncated[,2, drop = FALSE][[1]])
p_d_truncated$Time <- strptime(p_d_truncated[,2, drop = FALSE][[1]],format = "%H:%M:%S")

p_d_truncated$Time <- strptime(x, "%Y-%m-%d %H:%M:%S")

 
 
# ploting and saving the the plot as "my_plot_4.png"

 png(file = "my_plot_4.png")
 
 par(mfrow=c(2,2))
 
 # plot-1
 plot(p_d_truncated$Time, as.numeric(as.character(p_d_truncated$Global_active_power)), type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "Datetime")

 #plot-2
plot(p_d_truncated$Time, as.numeric(as.character(p_d_truncated$Voltage)), type = "l", col = "blue", xlab = "datetime", ylab = "Voltage(V)")

#plot-3
plot(p_d_truncated$Time, as.numeric(as.character(p_d_truncated$Sub_metering_1)), type = "l", ylab = "Energy Sub Metering", xlab = "Datetime", col = "black")

lines(p_d_truncated$Time, as.numeric(as.character(p_d_truncated$Sub_metering_2)), type = "l", col = "blue")

lines(p_d_truncated$Time, as.numeric(as.character(p_d_truncated$Sub_metering_3)), type = "l", col = "red")
legends = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend( "topright", legends, col = c("black", "red", "blue"), lty = 1) 

# plot-4

plot(p_d_truncated$Time, as.numeric(as.character(p_d_truncated$Global_reactive_power)), type = "l", ylab = "Global Reactive Power (Kilowatts)", xlab = "Datetime")


dev.off()
