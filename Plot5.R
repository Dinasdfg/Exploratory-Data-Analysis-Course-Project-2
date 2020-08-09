Plot5

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
SCC_vehicle <- SCC[grep("Veh", SCC$Short.Name, ignore.case = TRUE),]
SCCBaltimore <- NEI %>% subset(NEI$SCC %in% SCC_vehicle$SCC) %>% filter(fips=="24510") %>% group_by(year) %>% summarise(Emissions=sum(Emissions))
library(RColorBrewer)
cols <- brewer.pal(4, "BuPu")
barplot(SCCBaltimore$Emissions, names.arg = SCCBaltimore$year, col=cols, xlab = "Years", ylab="Pm2.5 Emissions", main = "Total Annual Vehicle Emissions in Baltimore City")
