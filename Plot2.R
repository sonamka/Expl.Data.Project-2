emissionstot.baltimore <- NEIdata %>%
  subset(fips == "24510") %>%
  group_by(year) %>%
  summarize(Total.Emissions.Baltimore = sum(Emissions, 
                                            na.rm = TRUE))

with(emissionstot.baltimore, 
     plot(x = year, 
          y = Total.Emissions.Baltimore, 
          ylab = "Total Annual Emissions", 
          xlab = "Year",
          main = "Total Emissions in Baltimore/YR",
          cex = .5,
          pch = 2,
          col = "red",
          lwd = 2))
emissionstot.baltimore.2008 <- emissionstot.baltimore[emissionstot.baltimore$year == 2008, 2]
emissionstot.baltimore.1999 <- emissionstot.baltimore[emissionstot.baltimore$year == 1999, 2]

delta.emissions.baltimore <- emissionstot.baltimore.2008 - emissionstot.baltimore.1999
dev.off()
