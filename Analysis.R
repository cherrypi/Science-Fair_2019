Pond_Data <- read.csv("CSV_DataStorage.csv", stringsAsFactors = FALSE)
Pond_Data$Date <- as.Date( Pond_Data$Date )
Pond_Data$Area <- ((Pond_Data$South + Pond_Data$North + 1500) / 2) * ((Pond_Data$West + Pond_Data$East + 1100) / 2) * pi
Pond_Data$Volume <- (((Pond_Data$South + Pond_Data$North + 1500) / 2) * ((Pond_Data$West + Pond_Data$East + 1100) / 2) * (Pond_Data$Depth) * (4/3) * pi) / 2
## These two equations are for area and volume of each measurement for the pond. The area calculation follows the equation for an ellipse: a*b*pi, and the volume calculation follows the equation for an ellipsoid: a*b*c*pi*(4/3), which is then divided by 2 to get half an ellipsoid, which represents the general shape of the pond.
## For reference the reason for adding the two sides together, and the extra 4 digit number, is because for the equation of an ellipse or an ellipsoid, a, b, and c, represent radii, but because the sides are uneven, I make a diameter to represent the general length of that axis, and then divide that by two to get the radius for that side.
## (The four digit number is just the base length of one axis of the bond in cm, because all my measurements are just the added length to the original length.)
