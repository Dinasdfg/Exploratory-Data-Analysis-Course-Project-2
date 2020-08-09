Plot1

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
total_emissions <- aggregate(Emissions ~ year, NEI, sum)
library(RColorBrewer)
cols <- brewer.pal(4, "BuPu")
barplot(total_emissions$Emissions/1000, names.arg = total_emissions$year, xlab = "Years", ylab = "Pm2.5 Emissions", main = "Total Emissions from All Sources", col=cols)
