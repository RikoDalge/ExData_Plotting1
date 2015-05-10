get_data <- function(){ 

        library(dplyr)
        library(lubridate)
        
        #Downloading and reading the File
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        file <- "household_power_consumption.txt"
        
        temp <- tempfile()
        download.file(url,temp)
        eletric <- read.table(unz(temp, file), sep=";", header = TRUE, 
                              na.strings = "?")
        
        unlink(temp)
        
        #Using dplyr and lubridate packages
        
        data <- tbl_df(eletric)
        data <- mutate(data, Date = dmy(Date))
        
        rm("eletric")
        
        #Filtering Days of Interest
        days <- filter(data, Date > "2007-01-31" & Date < "2007-02-02")
        days <- mutate(days, Week = wday(Date, label = TRUE))
        days<-mutate(days, Date.Time = ymd(Date)+hms(Time))
        rm("data")
        
        return(days)
        
}
