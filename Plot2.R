Plot2

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Emissions<-subset(NEI, NEI$fips == "24510")
byyear <- aggregate(Emissions$Emissions, by=list(Emissions$year), sum)
library(RColorBrewer)
cols <- brewer.pal(4, "BuPu")
barplot(byyear$x/1000, names.arg = byyear$Group.1, xlab = "Years", ylab = "Pm2.5 Emissions", main = "Baltimore, Maryland Emissions from 1999 to 2008", col=cols)
