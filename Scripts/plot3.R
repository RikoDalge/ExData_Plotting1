#Plot 3

#Chack if the data exists - if not will download it
if (!exists("days", inherits = FALSE)){     
        source("./get_clean_data.R")
        days <- get_data()
}

#Check if the plots directory exists
if(!file.exists("plots")){
        dir.create("plots")
}

#Open PNG Device
png(filename='./plots/plot3.png',width=480,height=480,units='px')

#Defining Labels and Colors

label = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
color = c("black","red","blue")

#Ploting Scatterplot

with(days,plot(Date.Time,Sub_metering_1,
               xlab = "",ylab = "Energy sub metering", type = "l",
               col="black"))
with(days,lines(Date.Time,Sub_metering_2, col = "red"))
with(days,lines(Date.Time,Sub_metering_3, col = "blue"))

legend('topright',legend=label,col=color,lty='solid', bty="o")

#Close PNG Device
dev.off()
