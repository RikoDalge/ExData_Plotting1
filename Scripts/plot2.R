source("./get_clean_data.R")

days <- get_data()

png(filename='./plots/plot2.png',width=480,height=480,units='px')

with(days,plot(Date.Time,Global_active_power, xlab = "",
               ylab = "Global Active Power", type = "l"))

dev.off()
