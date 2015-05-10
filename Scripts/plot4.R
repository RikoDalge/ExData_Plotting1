#Plot 4

#Check to see if the data is already in.
if (!exists("days", inherits = FALSE)){  
        source("./get_clean_data.R")
        days <- get_data()
}


if(!file.exists("plots")){
        dir.create("plots")
}

#Open Device
png(filename='./plots/plot4.png',width=480,height=480,units='px')

#Defining Labels and Colors

label = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
color = c("black","red","blue")

#Split the screen in 4 spots
par(mfrow = c(2, 2))

#Create the plots
with(days, {
        
        plot(Date.Time,Global_active_power, xlab = "",
             ylab = "Global Active Power", type = "l")
        
        plot(Date.Time,Voltage, xlab = "datetime",
             ylab = "Voltage", type = "l")
        
        plot(Date.Time,Sub_metering_1,
             xlab = "",ylab = "Energy sub metering", type = "l",
             col="black")
        lines(Date.Time,Sub_metering_2, col = "red")
        lines(Date.Time,Sub_metering_3, col = "blue")
        legend('topright',legend=label,col=color,lty='solid', bty="n")
        
        plot(Date.Time,Global_reactive_power, xlab = "datetime",
             ylab = "Global Reactive Power", type = "l")
})

#Close the device
dev.off()
