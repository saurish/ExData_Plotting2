setwd("C:/Users/sbhowmi/Desktop/Self Learning/Exploratory Data Analyis/Course_Directory/Week4")


png(file = "plot6.png")

NEI <- readRDS("project_data/summarySCC_PM25.rds")
SCC <- readRDS("project_data/Source_Classification_Code.rds")

# motor vehicle related data
motorData <- subset(SCC, grepl("Motor Vehicle", SCC.Level.Three))

# merge data frame NEI & motorData on column "SCC"
mergedData <- merge(NEI, motorData, by = "SCC")

baltimoreData <- subset(mergedData, fips=="24510") # baltimore data
laData        <- subset(mergedData, fips=="06037") # LA data

combinedData <- rbind(baltimoreData, laData) # merging them in a single table

# aggregate data on "emission" column
emissionData <- aggregate(Emissions ~ year + fips, combinedData, sum)

emissionData$fips <- factor(emissionData$fips)
levels(emissionData$fips) <- c("Los Angeles", "Baltimore")

plt <- ggplot(data = emissionData, aes(x = year, y= Emissions, group=1)) + 
                                                            geom_point() + 
                                                  geom_line(color="red") +  
                                                      facet_grid(.~fips)

# add custom range & scale marking on x-axis
plt + scale_x_continuous(breaks = c(1999, 2002, 2005, 2008),  
                         labels = c("1999", "2002", "2005", "2008"), 
                         limits = c(1998,2009)) +
  scale_y_continuous(name="Emissions From Motor Vehicle")

dev.off()