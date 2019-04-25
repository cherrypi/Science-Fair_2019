Pond_Data <- read.csv("CSV_DataStorage.csv", stringsAsFactors = FALSE)
Pond_Data$Date <- as.Date( Pond_Data$Date )
Pond_Data$Area <- ((Pond_Data$South + Pond_Data$North + 1500) / 2) * ((Pond_Data$West + Pond_Data$East + 1100) / 2) * pi
Pond_Data$Volume <- (((Pond_Data$South + Pond_Data$North + 1500) / 2) * ((Pond_Data$West + Pond_Data$East + 1100) / 2) * (Pond_Data$Depth) * (4/3) * pi) / 2
