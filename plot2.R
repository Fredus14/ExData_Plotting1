#########################################################################################################################
#                                    Exploratory Data Analysis  
#                                           Project 1
#                                         plot2.R script
#                                                                                                                       
#    This function was designed to make the second plot for the assignment of project 1  
#    using the data organized by the prep_data.R script. It will save the plot in 
#    the plots directory (created if necessary).
#
#########################################################################################################################


# Make plot 2
plot2 <- function(){
        
        #Check if tidy data has been created and run script to create it if not
        if (!file.exists("data/tidy.rds")){
                source("prep_data.R")
        }
        
        #loads tidy data to be used to make plot
        subset.df <- readRDS("data/tidy.rds")
        
        #Check if plots directory exists in the working directory and creates one if it doesn't 
        if (!file.exists("plots")) {
                message("Creating plots directory...")
                dir.create("plots")
        }


        png(filename='plots/plot2.png')

        message("Making plot 2...")

        plot(subset.df$date.time, subset.df$Global_active_power,
             ylab='Global Active Power (kilowatts)', 
             xlab='', 
             type='l')

        dev.off()
        message("Plot 2 image (png) was saved in the plots directory")
}

plot2()