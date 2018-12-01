setwd("C:/Users/sbhowmi/Desktop/Self Learning/Exploratory Data Analyis/Course_Directory/Week4")


png(file = "plot4.png")

NEI <- readRDS("project_data/summarySCC_PM25.rds")
SCC <- readRDS("project_data/Source_Classification_Code.rds")

# coal combustion related data
coalData <- subset(SCC, grepl("Coal", EI.Sector))

# merge data frame NEI & coalData on column "SCC"
mergedData <- merge(NEI, coalData, by = "SCC")

# aggregate data on "emission" column
emissionDataFromCoal <- aggregate(Emissions ~ year, mergedData, sum)


# plot using ggplot

plt <- ggplot(data = emissionDataFromCoal, aes(x = year, y= Emissions, group=1)) + 
                                                                    geom_point() + 
                                                          geom_line(color="red")

plt + scale_x_continuous(breaks = c(1999, 2002, 2005, 2008),  
                         labels = c("1999", "2002", "2005", "2008"), 
                         limits = c(1998,2009)) + 
      scale_y_continuous(name="Emissions From Coal")

dev.off()