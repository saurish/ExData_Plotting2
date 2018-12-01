setwd("C:/Users/sbhowmi/Desktop/Self Learning/Exploratory Data Analyis/Course_Directory/Week4")

library(ggplot2)

png(file = "plot3.png")

## reading the data
NEI <- readRDS("project_data/summarySCC_PM25.rds")
SCC <- readRDS("project_data/Source_Classification_Code.rds")


## partition data base on four types of roads
non_road_data   <- subset(NEI, type == 'NON-ROAD')
non_point_data  <- subset(NEI, type == 'NONPOINT')
on_road_data    <- subset(NEI, type == 'ON-ROAD')
point_data      <- subset(NEI, type == 'POINT')


## aggregate on total emission
totalEmissionByYear_NRData   <- aggregate(Emissions ~ type + year, non_road_data, sum)
totalEmissionByYear_NPData   <- aggregate(Emissions ~ type + year, non_point_data, sum)
totalEmissionByYear_ORData   <- aggregate(Emissions ~ type + year, on_road_data, sum)
totalEmissionByYear_PData    <- aggregate(Emissions ~ type + year, point_data, sum)

# merge data
emissionData <- rbind(totalEmissionByYear_NRData, totalEmissionByYear_NPData, totalEmissionByYear_ORData, totalEmissionByYear_PData)

# basic plot structure
plt <- ggplot(data = emissionData, aes(x = year, y= Emissions, group=1)) + geom_point() + geom_line(color="red") +  facet_grid(.~type)

# add custom range & scale marking on x-axis
plt + scale_x_continuous(breaks = c(1999, 2002, 2005, 2008),  labels = c("1999", "2002", "2005", "2008"), limits = c(1998,2009))

dev.off()