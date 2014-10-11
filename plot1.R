#########################################################################################################################
#                                    Exploratory Data Analysis  
#                                           Project 1
#                                         plot1.R script
#                                                                                                                       
#    This function was designed to make the first plot for the assignment of project 1  
#    using the data organized by the prep_data.R script. It will save the plot in 
#    the plots directory (created if necessary).
#
#########################################################################################################################

# Make plot 1
plot1 <- function(){
        
        #Check if tidy data has been created and run script to create it if not
        if (!file.exists("data/tidy.rds")){
                source("scripts/prep_data.R")
        }
        
        #loads tidy data to be used to make plot
        subset.df <- readRDS("data/tidy.rds")
        
        #Check if plots directory exists in the working directory and creates one if it doesn't 
        if (!file.exists("plots")) {
                message("Creating plots directory...")
                dir.create("plots")
        }
        
        png(filename='plots/plot1.png')
        
        message("Making plot 1...")
        
        hist(subset.df$Global_active_power,
             main='Global Active Power', 
             xlab='Global Active Power (kilowatts)', 
             ylab='Frequency',
             col='red')

        dev.off()
        message("Plot 1 image (png) was saved in the plots directory")
}

plot1()