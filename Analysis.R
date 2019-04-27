library(ggplot2)

Pond_Data <- read.csv("CSV_DataStorage.csv", stringsAsFactors = FALSE)
Pond_Data$Date <- as.Date( Pond_Data$Date )
## These two equations are for area and volume of each measurement for the pond.
Pond_Data$Area <- ((Pond_Data$South + Pond_Data$North + 1500) / 2) * ((Pond_Data$West + Pond_Data$East + 1100) / 2) * pi
Pond_Data$Volume <- (((Pond_Data$South + Pond_Data$North + 1500) / 2) * ((Pond_Data$West + Pond_Data$East + 1100) / 2) * (Pond_Data$Depth) * (4/3) * pi) / 2

## The area calculation follows the equation for an ellipse: a*b*pi, and the volume calculation follows the equation for an ellipsoid: a*b*c*pi*(4/3),
## Which is then divided by 2 to get half an ellipsoid, which represents the general shape of the pond.
## For reference the reason for adding the two sides together, and the extra 4 digit number,
## Is because for the equation of an ellipse or an ellipsoid, a, b, and c, represent radii, but because the sides are uneven, I make a diameter to represent the general length of that axis, and then divide that by two to get the radius for that side.
## (The four digit number is just the base length of one axis of the pond in cm, because all my measurements are just the added length to the original length.)

options(scipen=999)

SPta <- ggplot(Pond_Data, aes(x=TemperatureMax , y=Area)) + geom_point(col="darkgreen", size=1.5) + geom_smooth(method="lm", col="red")
SPtaL <- SPta + labs(title="Correlation Between Temperature and Area", subtitle="Everyday Data from Vernal Pond", y="Surface Area of Pond (cm^2)", x=" Temperature Maximum (*F)", caption="NA")
SPtaZ <- SPtaL + coord_cartesian(xlim=c(25,77.5), ylim=c(1300000,2100000))

SPtv <- ggplot(Pond_Data, aes(x=TemperatureMax , y=Volume)) + geom_point(col="darkgreen", size=1.5) + geom_smooth(method="lm", col="red")
SPtvL <- SPtv + labs(title="Correlation Between Temperature and Volume", subtitle="Everyday Data from Vernal Pond", y="Volume of Pond (cm^3)", x=" Temperature Maximum", caption="NA")
SPtvZ <- SPtvL + coord_cartesian(xlim=c(25,77.5), ylim=c(1300000,20000000))  
