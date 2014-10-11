#########################################################################################################################
#                                    Exploratory Data Analysis  
#                                           Project 1
#                                      prep_data.R script
#                                                                                                                       
#    This script was designed to download and unzip a datset available in                                                     
#    https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip                              
#    then load and prepare the data for making the plots for the assignment of project 1
#    if this has not been done before
#   
#    To run this script use the following comand:
#    source("scripts/prep_data")
#
#########################################################################################################################


get.data = function() {
        
        #Check if data directory exists in the working directory and creates one if it doesn't 
        if (!file.exists("data")) {
                message("Creating data directory...")
                dir.create("data")
        }
        
        # Download and unzip original raw dataset if it has not been downloaded already
        if (!file.exists("data/household_power_consumption.txt")) {
                fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
                zipfile="data/exdata-data-household_power_consumption.zip"
                message("Downloading data...")
                download.file(fileURL, destfile=zipfile, method="curl")
                unzip(zipfile, exdir="data")
        }
}


tidyup.data = function() {
        
        if (!file.exists("data/tidy.rds")){
                
        # Read data into a data frame with appropriate classes
        message("reading household_power_consumption.txt data...")
        power.df <- read.table("data/household_power_consumption.txt", 
                               header=TRUE,
                               sep=";", 
                               na.strings="?",
                               colClasses=c(rep("character", 2), 
                                            rep("numeric", 7)
                                            )
                               )
        
        
        # Convert dates and times
        library(lubridate)
        
        power.df$Date <- dmy(power.df$Date)
        power.df$Time <- hms(power.df$Time)
        
        # subset data frame to the period needed
        message("Tidying up data set...")
        subset.df <- subset(power.df, year(Date) == 2007 & 
                                    month(Date) == 2 &
                                    (day(Date) == 1 | day(Date) == 2))
        
        # Combine date and time
        subset.df$date.time <- subset.df$Date + subset.df$Time
        
        # Save organized data subset.df object (tidy.rds) in data directory to be used by the plot scripts
        saveRDS(subset.df, file="data/tidy.rds")
        message("Tidy data set was saved in data directory and is ready to use for making the plots")
}else{
        message("Tidy data set alredy exist in data directory and is ready to be used for making the plots")
}
}

#Wrap up function calling the two functions above to prepare a tidy data set for making the plots
prep.data = function(){
                        get.data() 
                        tidyup.data()
}


prep.data()
