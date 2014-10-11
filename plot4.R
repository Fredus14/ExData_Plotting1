#########################################################################################################################
#                                    Exploratory Data Analysis  
#                                           Project 1
#                                         plot4.R script
#                                                                                                                       
#    This function was designed to make the fourth plot for the assignment of project 1  
#    using the data organized by the prep_data.R script. It will save the plot in 
#    the plots directory (created if necessary).
#
#########################################################################################################################


# Make plot 4
plot4 <- function(){
        
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

        png(filename='plots/plot4.png')
        message("Making plot 4...")

        # Set up panel dimentions with two rows and two columns
        par(mfrow=c(2,2))

        # First plot (Top left)
        plot(subset.df$date.time, subset.df$Global_active_power,
             type='l',
             xlab='',
             ylab='Global Active Power')

        # Second plot (Top right)
        plot(subset.df$date.time, subset.df$Voltage,
             type='l', 
             xlab='datetime', 
             ylab='Voltage')

        # Third plot (Bottom left)
        plot(subset.df$date.time, subset.df$Sub_metering_1, 
             type='l',
             xlab='',
             ylab='Energy sub metering')
        lines(subset.df$date.time, subset.df$Sub_metering_2, col='red')
        lines(subset.df$date.time, subset.df$Sub_metering_3, col='blue')
        legend('topright', 
                col=c('black', 'red', 'blue'), 
                legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
                lty='solid', 
                bty='n')

        # Fourth plot (Bottom right)
        plot(subset.df$date.time, subset.df$Global_reactive_power, 
                type='l',
                xlab='datetime',
                ylab='Global_reactive_power')

        dev.off()
        message("Plot 4 image (png) was saved in the plots directory")
}

plot4()