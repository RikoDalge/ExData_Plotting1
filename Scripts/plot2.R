#Plot 2

#Check to see if the data is already in.
if (!exists("days", inherits = FALSE)){  
        source("./get_clean_data.R")
        days <- get_data()
}

#Check if the plots directory exists
if(!file.exists("plots")){
        dir.create("plots")
}

png(filename='./plots/plot2.png',width=480,height=480,units='px')

with(days,plot(Date.Time,Global_active_power, xlab = "",
               ylab = "Global Active Power", type = "l"))

dev.off()
