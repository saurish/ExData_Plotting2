setwd("C:/Users/sbhowmi/Desktop/Self Learning/Exploratory Data Analyis/Course_Directory/Week4")


png(file = "plot5.png")

NEI <- readRDS("project_data/summarySCC_PM25.rds")
SCC <- readRDS("project_data/Source_Classification_Code.rds")

# motor vehicle related data
motorData <- subset(SCC, grepl("Motor Vehicle", SCC.Level.Three))

# merge data frame NEI & motorData on column "SCC"
mergedData <- merge(NEI, motorData, by = "SCC")

#subsetting baltimore data
baltimoreData <- subset(mergedData, fips=="24510")

# aggregate data on "emission" column
emissionDataFromMV <- aggregate(Emissions ~ year, baltimoreData, sum)


# plot using ggplot
plt <- ggplot(data = emissionDataFromMV, aes(x = year, y= Emissions, group=1)) + 
  geom_point() + 
  geom_line(color="red")

plt + scale_x_continuous(breaks = c(1999, 2002, 2005, 2008),  
                         labels = c("1999", "2002", "2005", "2008"), 
                         limits = c(1998,2009)) + 
  scale_y_continuous(name="Emissions From Motor Vehicle (Baltimore)")

dev.off()