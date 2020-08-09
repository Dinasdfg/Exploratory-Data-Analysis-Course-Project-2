Plot4

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Coal_SCC <- SCC[grep("coal", SCC$EI.Sector, ignore.case = TRUE),]
library(dplyr)
NEI_SCC <- filter(NEI, NEI$SCC %in% Coal_SCC$SCC)
Coal_sum <- NEI_SCC %>% group_by(year) %>% summarise(Emissions=sum(Emissions))
library(RColorBrewer)
cols <- brewer.pal(4, "BuPu")
barplot(Coal_sum$Emissions/1000, names.arg = Coal_sum$year, col=cols, xlab = "Years", ylab="Pm2.5 Emissions", main = "Coal Combustion Emissions, 1999 to 2008")