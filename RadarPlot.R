library("ggplot2")
library("fmsb")

Pond_Data <- read.csv("CSV_DataStorage.csv", stringsAsFactors = FALSE)
Pond_Data$Date <- as.Date( Pond_Data$Date )
## Thesue two equations are for area and volume of each measurement for the pond.
Pond_Data$Area <- (((Pond_Data$South + Pond_Data$North + 1500) / 2) * ((Pond_Data$West + Pond_Data$East + 1100) / 2) * pi) / 10000
Pond_Data$Volume <- ((((Pond_Data$South + Pond_Data$North + 1500) / 2) * ((Pond_Data$West + Pond_Data$East + 1100) / 2) * (Pond_Data$Depth) * (4/3) * pi) / 2) / 1000000


## Code for radar plot, from: https://www.r-graph-gallery.com/142-basic-radar-chart/, http://www.r-graph-gallery.com/143-spider-chart-with-saveral-individuals/, https://www.data-to-viz.com/caveat/spider.html

message("starting")

PondData_Radar <- data.frame(Pond_Data[103:109,4:7])

PondData_RadarAll  <- data.frame(Pond_Data[,4:7])

PondData_RadarAllNA  <- na.exclude(PondData_RadarAll)


RCda <- radarchart(PondData_RadarAllNA, maxmin = FALSE, pfcol=c(rgb(0.1,0.1,0.5,0.025)), na.itp = FALSE, pty = 32, pcol = 0:0)

## RCd <- radarchart(PondData_Radar, maxmin = FALSE, pfcol=c(rgb(0.3,0.5,0.6,0.2), rgb(0.6,0.4,0.5,0.5), rgb(0.7,0.3,0.5,0.2),
## rgb(0.2,0.7,0.5,0.6), rgb(0.4,0.3,0.5,0.5), rgb(0.4,0.5,0.4,0.2), rgb(0.2,0.3,0.5,0.1), vlcex=0.8))
## + legend(x=0.7, y=1, legend = rownames(data[-c(1,2),]), bty = "n", pch=20 , col=colors_in , text.col = "grey", cex=1.2, pt.cex=3)

ppi <- 300

message("Plotting")
png("/abyss/Common/Brian/School Work/Science Fair Project --- Vernal Pond: 2019_7th Grade/Data, CSV, Pickle Graph/Science-Fair_2019/Graphs/RCda.png", width=10*ppi, height=6*ppi, res=ppi)
print(RCda)
dev.off()
