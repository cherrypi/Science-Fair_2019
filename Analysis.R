library(ggplot2)

Pond_Data <- read.csv("CSV_DataStorage.csv", stringsAsFactors = FALSE)
Pond_Data$Date <- as.Date( Pond_Data$Date )
## Thesue two equations are for area and volume of each measurement for the pond.
Pond_Data$Area <- (((Pond_Data$South + Pond_Data$North + 1500) / 2) * ((Pond_Data$West + Pond_Data$East + 1100) / 2) * pi) / 10000
Pond_Data$Volume <- ((((Pond_Data$South + Pond_Data$North + 1500) / 2) * ((Pond_Data$West + Pond_Data$East + 1100) / 2) * (Pond_Data$Depth) * (4/3) * pi) / 2) / 1000000

## The area calculation follows the equation for an ellipse: a*b*pi, and the volume calculation follows the equation for an ellipsoid: a*b*c*pi*(4/3).
## Divided by 2 to get half an ellipsoid, represents general shape of the pond.
## Extra 4 digit number represents base length of a pond axis.
## Reason for adding the two sides together is for the equation of an ellipse or an ellipsoid, a, b, and c, represent radii, but because the sides are uneven, I make a diameter to represent the general length of that axis, and then divide that by two to get the radius for that side.

## Code used to make graphs, from: http://r-statistics.co/Complete-Ggplot2-Tutorial-Part1-With-R-Code.html

## Disables sientific notation.
options(scipen=999)

## Code used to make Date over X graphs.

## SPvD <- ggplot(Pond_Data, aes(x=Volume, y=Date)) + geom_point(col="green", size=1.5) + geom_smooth(method="lm", col="darkgreen")
## SPvDL <- SPvD + labs(title="Volume over Time", subtitle="Everyday Data from Vernal Pond", y="Date", x="Volume of Pond (m^3)", caption="NA")
## SPvDZ <- SPvDL + coord_cartesian(xlim=c(0,20), )



SPta <- ggplot(Pond_Data, aes(x=TemperatureMax, y=Area)) + geom_point(col="darkgreen", size=1.5) + geom_smooth(method="lm", col="red")
SPtaL <- SPta + labs(title="Correlation Between Temperature and Area", subtitle="Everyday Data from Vernal Pond", y="Surface Area of Pond (m^2)", x="Temperature Maximum (*F)", caption="NA")
SPtaZ <- SPtaL + coord_cartesian(xlim=c(25,77.5), ylim=c(130,210))

SPtv <- ggplot(Pond_Data, aes(x=TemperatureMax, y=Volume)) + geom_point(col="darkgreen", size=1.5) + geom_smooth(method="lm", col="red")
SPtvL <- SPtv + labs(title="Correlation Between Temperature and Volume", subtitle="Everyday Data from Vernal Pond", y="Volume of Pond (m^3)", x="Temperature Maximum", caption="NA")
SPtvZ <- SPtvL + coord_cartesian(xlim=c(25,77.5), ylim=c(0,20)) + theme(plot.title = element_text(size=22), plot.subtitle = element_text(size=22), plot.tag = element_text(size=22))

SPra <- ggplot(Pond_Data, aes(x=Rain, y=Area)) + geom_point(col="darkblue", size=1.5) + geom_smooth(method="lm", col="darkgoldenrod3")
SPraL <- SPra + labs(title="Correlation Between Precipitation and Area", subtitle="Everyday Data from Vernal Pond", y="Surface Area of Pond (m^2)", x="Rainfall (in.)", caption="NA")
SPraZ <- SPraL + coord_cartesian(xlim=c(0,2.25), ylim=c(137.5,220))

SPrv <- ggplot(Pond_Data, aes(x=Rain, y=Volume)) + geom_point(col="darkblue", size=1.5) + geom_smooth(method="lm", col="darkgoldenrod3")
SPrvL <- SPrv + labs(title="Correlation Between Precipitation and Volume", subtitle="Everyday Data from Vernal Pond", y="Volume of Pond (m^3)", x="Rainfall (in.)", caption="NA")
SPrvZ <- SPrvL + coord_cartesian(xlim=c(0,2.25), ylim=c(0,25)) + theme(plot.title = element_text(size=22), plot.subtitle = element_text(size=22), plot.tag = element_text(size=22))

SPrd <- ggplot(Pond_Data, aes(x=Rain, y=Depth)) + geom_point(col="darkblue", size=1.5) + geom_smooth(method="lm", col="aquamarine4")
SPrdL <-SPrd + labs(title="Correlation Between Precipitation and Depth", subtitle="Everyday Data from Vernal Pond", y="Depth (in.)", x="Rainfall (in.)", caption="NA")
SPrdZ <- SPrdL + coord_cartesian(xlim=c(0,2.25), ylim=c(0,20))

SPtd <- ggplot(Pond_Data, aes(x=TemperatureMax, y=Depth)) + geom_point(col="darkgreen", size=1.5) + geom_smooth(method="lm", col="aquamarine4")
SPtdL <- SPtd + labs(title="Correlation Between Temperature and Depth", subtitle="Everyday Data from Vernal Pond", y="Depth (in.)", x="Temperature Maxium (*F)", caption="NA")
SPtdZ <- SPtdL + coord_cartesian(xlim=c(25,77.5), ylim=c(0,20))

SPtr <- ggplot(Pond_Data, aes(x=TemperatureMax, y=Rain)) + geom_point(col="darkgreen", size=1.5) + geom_smooth(method="lm", col="aquamarine4")
SPtrL <- SPtr + labs(title="Correlation Between Temperature and Precipitation", subtitle="Everyday Data from Vernal Pond", y="Rainfall (in.)", x="Temperature Maxium (*F)", caption="NA")
SPtrZ <- SPtrL + coord_cartesian(xlim=c(25,77.5), ylim=c(0,2.35))

## Code used for Y over Date graphs, https://stackoverflow.com/questions/28243514/ggplot2-change-title-size for some Code

SPDv <- ggplot(Pond_Data, aes(x=Date, y=Volume)) + geom_point(col="firebrick4", size=1.5)
SPDvL <- SPDv + labs(title="Volume Data Throughout Experiment", subtitle="Everyday Data from Vernal Pond", y="Volume of Pond (m^3)", x="Date", caption="NA")
SPDvZ <- SPDvL + coord_cartesian(, ylim=c(0,25)) + theme(plot.title = element_text(size=22), plot.subtitle = element_text(size=22), plot.tag = element_text(size=22))

## Code used to make lollipop graph, from http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html#Lollipop%20Chart

LPPDr <- ggplot(Pond_Data, aes(x=Date, y=Rain)) + geom_point(col="dodgerblue2", size=1.5)
LPPDrC <- LPPDr + geom_segment(aes(x=Date, xend=Date, y=0, yend=Rain)) + theme(plot.title = element_text(size=22), plot.subtitle = element_text(size=22), plot.tag = element_text(size=22))
LPPDrT <- LPPDrC + labs(title="Precipitation Data Throughout Experiment", subtitle="Everyday Data from Vernal Pond", caption="NA")

## Code used to make line graph, from https://www.r-graph-gallery.com/279-plotting-time-series-with-ggplot2/

LIPDt <- ggplot(Pond_Data, aes(x=Date, y=TemperatureMax)) + geom_line() + ylab("Temperature Maximum (*F)")

## Code used to make PNG versions of graph, from: http://www.cookbook-r.com/Graphs/Output_to_a_file/

ppi <- 300

png("/abyss/Common/Brian/School Work/Science Fair Project --- Vernal Pond: 2019_7th Grade/Data, CSV, Pickle Graph/Science-Fair_2019/Graphs/SPrvZ.png", width=10*ppi, height=6*ppi, res=ppi)
print(SPrvZ)
dev.off()
