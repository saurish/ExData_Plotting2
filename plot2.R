# Plot 2

setwd("C:/Users/sbhowmi/Desktop/Self Learning/Exploratory Data Analyis/Course_Directory/Week4")
png(file = "plot2.png")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("project_data/summarySCC_PM25.rds")
SCC <- readRDS("project_data/Source_Classification_Code.rds")

baltimoreData <- subset(NEI, fips=="24510")
totalEmissionInBaltimoreByYear <- aggregate(Emissions ~ year, baltimoreData, sum)

xlabels <- factor(totalEmissionInBaltimoreByYear$year)



plot(totalEmissionInBaltimoreByYear$year, totalEmissionInBaltimoreByYear$Emissions, pch=19, ylab ="Total Emission (Baltimore City)", xlab = "Year", xaxt="n", type = "n")
lines(totalEmissionInBaltimoreByYear$year, totalEmissionInBaltimoreByYear$Emissions, pch=19, type="o")
axis(1, labels = xlabels,  at = totalEmissionInBaltimoreByYear$year)

dev.off()