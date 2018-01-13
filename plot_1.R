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

# ploting and saving the plot as "my_plot_1.png"

png(file = "my_plot_1.png")
with(faithful,hist(as.numeric(as.character(p_d_truncated$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)"))
dev.off()


