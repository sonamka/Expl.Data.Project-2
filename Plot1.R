projecturl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
destfile1 <- "NEI_data.zip"

if(!file.exists(destfile1)) {
  download.file(url1, 
                destfile = destfile1, 
                method = "curl")
  unzip(destfile1, exdir = "."}


NEIdata <- readRDS("summarySCC_PM25.rds")
SCCdata <- readRDS("Source_Classification_Code.rds")

head(NEIdata)
library(dplyr)
emissions_yrtotal <- NEIdata%>%
  group_by(year)%>%
  summarize(Total.Emissions = sum(Emissions, na.rm = TRUE))
emissions_yrtotal
with(emissions_yrtotal,
     plot(x = year, 
          y = Total.Emissions, 
          ylab = "Total Annual Emissions", 
          xlab = "Year",
          main = "Total Annual Emissions in the US by Year",
          cex =.5,
          pch = 2,
          col = "red",
          lwd = 2))
emissionstot.2008 <- emissions_yrtotal[emissions_yrtotal$year == 2008, 2]
emissionstot.1999 <- emissions_yrtotal[emissions_yrtotal$year == 1999, 2]

delta.emissionstot <- emissionstot.2008 - emissionstot.1999
dev.off()