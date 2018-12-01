setwd("C:/Users/sbhowmi/Desktop/Self Learning/Exploratory Data Analyis/Course_Directory/Week4")

png(file = "plot1.png")

## reading data
NEI <- readRDS("project_data/summarySCC_PM25.rds")
SCC <- readRDS("project_data/Source_Classification_Code.rds")

# aggregating on "Emission" column
totalEmissionByYear <- aggregate(Emissions ~ year, NEI, sum)

# year-labeling x coulmns
xlabels <- factor(totalEmissionByYear$year)


# base plot
plot(totalEmissionByYear$year, totalEmissionByYear$Emissions, pch=19, ylab ="Total Emission", 
                                                             xlab = "Year", xaxt="n", type="n")

# adding line
lines(totalEmissionByYear$year, totalEmissionByYear$Emissions, type="o")

# x-axis labeling
axis(1, labels = xlabels,  at = totalEmissionByYear$year)

dev.off()