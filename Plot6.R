Plot6

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
SCC_vehicle <- SCC[grep("Veh", SCC$Short.Name, ignore.case = TRUE),]
SCC.Balt.LA <- NEI %>% subset(NEI$SCC %in% SCC_vehicle$SCC) %>% filter(fips=="24510" | fips =="06037")  %>% group_by(year, fips) %>% summarise(Emissions=sum(Emissions))
library(RColorBrewer)
cols <- brewer.pal(4, "BuPu")
SCC.Balt.LA$county_name <- factor(SCC.Balt.LA$fips, levels=c("06037", "24510"), labels=c("Los Angeles County", "Baltimore City"))
library(ggplot2)
plot <- ggplot(SCC.Balt.LA, aes(x=year, y=Emissions, fill=county_name)) + geom_bar(stat = "identity") +scale_fill_manual(values=c("#8C96C6","#B3CDE3")) + theme_minimal()+xlab("Years")+ylab("Pm2.5 Emissions") + ggtitle("Los Angeles vs Baltimore Vehicle Emissions.")
plot