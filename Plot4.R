SCC.coal<- SCCdata[grep("[Cc]oal",SCCdata$EI.Sector),]
NEI.sub.coal <- subset(NEIdata, 
                       NEIdata$SCCdata %in% SCC.coal$SCCdata)
NEI.coal<- merge(x = NEI.sub.coal, 
                 y = SCCdata, 
                 by.x = "SCC", 
                 by.y = "SCC")
library(dplyr)
NEI.coaltot <- NEI.coal %>% 
     group_by(year) %>%
     summarize(Total.Coal.Comb = sum(Emissions, na.rm = TRUE))


library(ggplot2)
NEI.coaltot.plot <- ggplot(NEI.coaltot, aes(year, Total.Coal.Comb))

NEI.coaltot.plot <- NEI.coaltot.plot + 
  geom_point(color = "red", 
             size = 4, 
             alpha = 1/4) + 
  xlab("Year") +
  ylab("Total Emissions") +
  ggtitle("Total Coal Combustion Emissions in the US")

NEI.coaltot.plot

NEI.coaltot.plot
NEI.coaltot.2008 <- NEI.coaltot[NEI.coaltot$year == 2008, 2]
NEI.coaltot.1999 <- NEI.coaltot[NEI.coaltot$year == 1999, 2]
 
   NEI.coaldelta <- NEI.coaltot.2008 - NEI.coaltot.1999
 NEI.coaldelta
 dev.off()