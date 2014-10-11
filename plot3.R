#########################################################################################################################
#                                    Exploratory Data Analysis  
#                                           Project 1
#                                         plot3.R script
#                                                                                                                       
#    This function was designed to make the third plot for the assignment of project 1  
#    using the data organized by the prep_data.R script. It will save the plot in 
#    the plots directory (created if necessary).
#
#########################################################################################################################

# Make plot 3
plot3 <- function(){
        
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

        png(filename='plots/plot3.png')
        message("Making plot 3...")
        
        plot(subset.df$date.time, subset.df$Sub_metering_1, type='l',
             xlab='', ylab='Energy sub metering')
                lines(subset.df$date.time, subset.df$Sub_metering_2, col='red')
                lines(subset.df$date.time, subset.df$Sub_metering_3, col='blue')
                legend('topright', 
                        legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
                col=c('black', 'red', 'blue'), 
                lty='solid')

        dev.off()
        message("Plot 3image (png) was saved in the plots directory")
}

plot3()