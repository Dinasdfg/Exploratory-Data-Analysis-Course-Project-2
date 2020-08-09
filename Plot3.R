Plot3

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
by_type <- NEI %>% subset(NEI$fips == "24510") %>% group_by(year, type) %>% summarise(Emissions=sum(Emissions))
library(ggplot2)
plot <- ggplot(by_type, aes(x=year, y=Emissions, fill=type)) + geom_bar(stat = "identity")+ xlab("Year") + ylab("Total Emissions") + ggtitle("Total Annual Emissions in Baltimore by Year")+facet_grid(. ~ type)+scale_fill_manual(values = c("#8C96B9", "#B3CDE3", "#8C96C1", "#88419D"))+theme_minimal()
plot
