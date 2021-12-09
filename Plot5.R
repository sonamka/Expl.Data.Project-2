vehicle.scc <- SCCdata[grep("[Vv]eh", SCCdata$Short.Name), ]
library(dplyr)

emissions.motor.baltimore <- NEIdata %>% 
  subset(fips == "24510" & NEIdata$SCCdata %in% vehicle.scc$SCCdata) %>%
  merge(y = vehicle.scc, by.x = "SCC", by.y = "SCC") %>%
  group_by(year) %>%
  summarize(Vehicle.Emissions.Type = sum(Emissions, na.rm = TRUE))
library(ggplot2)

emissions.motor.bplot <- ggplot(emissions.motor.baltimore, aes(year, Vehicle.Emissions.Type)) +
  geom_point(color = "red", 
             size = 4, 
             alpha = 1/3) + 
  xlab("Year") +
  ylab("Total Emissions") +
  ggtitle("Total Vehicle Emissions in Baltimore City")

emissions.motor.bplot
emissions.motor.baltimore.2008 <- emissions.motor.baltimore[emissions.motor.baltimore$year  == 2008, 2]
emissions.motor.baltimore.1999 <- emissions.motor.baltimore[emissions.motor.baltimore$year  == 1999, 2]

baltimore.delta <- emissions.motor.baltimore.2008 - emissions.motor.baltimore.1999
dev.off()