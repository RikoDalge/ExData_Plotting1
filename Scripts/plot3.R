
source("./get_clean_data.R")

days <- get_data()

png(filename='./plots/plot3.png',width=480,height=480,units='px')

#Ploting Scatterplot 3

label = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
color = c("black","red","blue")

with(days,plot(Date.Time,Sub_metering_1,
               xlab = "",ylab = "Energy sub metering", type = "l",
               col="black"))
with(days,lines(Date.Time,Sub_metering_2, col = "red"))
with(days,lines(Date.Time,Sub_metering_3, col = "blue"))

legend('topright',legend=label,col=color,lty='solid')

dev.off()
