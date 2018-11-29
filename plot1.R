setwd("C:/Users/sbhowmi/Desktop/Self Learning/Exploratory Data Analyis/Course_Directory/Week4")

png(file = "plot1.png")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("project_data/summarySCC_PM25.rds")
SCC <- readRDS("project_data/Source_Classification_Code.rds")

# Plot 1

totalEmissionByYear <- aggregate(Emissions ~ year, NEI, sum)

xlabels <- factor(totalEmissionByYear$year)
plot(totalEmissionByYear$year, totalEmissionByYear$Emissions, pch=19, ylab ="Total Emission", xlab = "Year", xaxt="n", type="n")
lines(totalEmissionByYear$year, totalEmissionByYear$Emissions, type="o")
axis(1, labels = xlabels,  at = totalEmissionByYear$year)

dev.off()