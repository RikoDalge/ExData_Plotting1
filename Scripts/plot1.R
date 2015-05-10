source("./get_clean_data.R")

days <- get_data()

png(filename='./plots/plot1.png',width=480,height=480,units='px')

#Ploting Histogram 1
hist(days$Global_active_power, main = "Global Active Power",
     xlab = "Gloabl Active Power (kilowatts)", col = "red",
     xlim = c(0,6))

axis(side=1,at=c(0,6, by=2))
axis(side=2,at=c(0,1200, by=200))

dev.off()
