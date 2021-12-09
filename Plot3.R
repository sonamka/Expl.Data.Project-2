emissionstot.type <- NEIdata %>% 
  subset(fips == "24510") %>%
  group_by(year, type) %>%
  summarize(Total.Emissions.Type = sum(Emissions, na.rm = TRUE))
library(ggplot2)
emissions.type <- ggplot(data = emissionstot.type, aes(year, Total.Emissions.Type))

emissions.type <- emissions.type +
  geom_point(color = "red", 
             size = 4,
             alpha = 1/4
             ) 
  facet_grid(. ~ type) 
  xlab("Year") 
  ylab("Total Emissions") 
  ggtitle("TotalEmissions in Baltimore/YR")

emissions.type
dev.off()