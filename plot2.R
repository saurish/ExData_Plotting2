
setwd("C:/Users/sbhowmi/Desktop/Self Learning/Exploratory Data Analyis/Course_Directory/Week4")
png(file = "plot2.png")

# reading data
NEI <- readRDS("project_data/summarySCC_PM25.rds")
SCC <- readRDS("project_data/Source_Classification_Code.rds")

# subsetting baltimore data
baltimoreData <- subset(NEI, fips=="24510")

# aggregating on "Emission" column
totalEmissionInBaltimoreByYear <- aggregate(Emissions ~ year, baltimoreData, sum)

# year-labeling x coulmns
xlabels <- factor(totalEmissionInBaltimoreByYear$year)

# base plot
plot(totalEmissionInBaltimoreByYear$year, totalEmissionInBaltimoreByYear$Emissions, pch=19, 
               ylab ="Total Emission (Baltimore City)", xlab = "Year", xaxt="n", type = "n")

# line plot
lines(totalEmissionInBaltimoreByYear$year, totalEmissionInBaltimoreByYear$Emissions, pch=19, type="o")

# x-axis labeling
axis(1, labels = xlabels,  at = totalEmissionInBaltimoreByYear$year)

dev.off()