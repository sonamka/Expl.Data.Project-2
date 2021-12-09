vehicle.scc <- SCCdata[grep("[Vv]eh", SCCdata$Short.Name), ]
library(dplyr)
emissions.motor.CA <- NEIdata %>% 
  subset(fips == "06037" & NEIdata$SCCdata %in% vehicle.scc$SCCdata) %>%
  merge(y = vehicle.scc, by.x = "SCC", by.y = "SCC") %>%
  group_by(year) %>%
  summarize(Vehicle.Emissions.Type = sum(Emissions, na.rm = TRUE))
library(ggplot2)
emissions.motor.comp <- rbind(emissions.motor.baltimore, emissions.motor.CA)

emissions.motor.cplot <- ggplot(emissions.motor.comp, aes(year, Vehicle.Emissions.Type)) +
  geom_point(size = 4, 
             alpha = 1/3) +
  xlab("Year") +
  ylab("Total Emissions") +
  ggtitle("Comparison of Total Vehicle Emissions in Baltimore and Los Angeles")

emissions.motor.cplot
emissions.motor.CA.2008 <- emissions.motor.CA[emissions.motor.CA$year  == 2008, 2]
emissions.motor.CA.1999 <- emissions.motor.CA[emissions.motor.CA$year  == 1999, 2]


delta.la <- emissions.motor.CA.2008 - emissions.motor.CA.1999
abs(delta.la) > abs(baltimore.delta)
dev.off()