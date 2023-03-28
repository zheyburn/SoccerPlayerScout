# 1.) Import dataset 
library(readr)
suppressMessages({
Brasil_Serie_A_Chance_Creation_Player_Data_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/Brasil Serie A 22/Brasil Serie A Chance Creation Player Data 22.csv")
Brasil_Serie_A_Possession_Player_Data_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/Brasil Serie A 22/Brasil Serie A Possession Player Data 22.csv")
Brasil_Serie_A_Shooting_Player_Data_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/Brasil Serie A 22/Brasil Serie A Shooting Player Data 22.csv")
Bundesliga_Possession_Player_Data_21_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/Bundesliga 21:22/Bundesliga  Possession Player Data 21:22.csv")
Bundesliga_Chance_Creation_Player_Data_21_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/Bundesliga 21:22/Bundesliga Chance Creation Player Data 21:22.csv")
Bundesliga_Shooting_Player_Data_21_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/Bundesliga 21:22/Bundesliga Shooting Player Data 21:22.csv")
Eridivisie_Chance_Creation_Player_Data_21_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/Eridivisie 21:22/Eridivisie Chance Creation Player Data 21:22.csv")
Eridivisie_Possession_Player_Data_21_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/Eridivisie 21:22/Eridivisie Possession Player Data 21:22.csv")
Eridivisie_Shooting_Player_Data_21_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/Eridivisie 21:22/Eridivisie Shooting Player Data 21:22.csv")
La_Liga_Chance_Creation_Player_Data_21_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/La Liga 21:22/La Liga Chance Creation Player Data 21:22.csv")
La_Liga_Possession_Player_Data_21_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/La Liga 21:22/La Liga Possession Player Data 21:22.csv")
La_Liga_Shooting_Player_Data_21_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/La Liga 21:22/La Liga Shooting Player Data 21:22.csv")
Liga_Primeira_Chance_Creation_Player_Data_21_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/Liga Primeira 21:22/Liga Primeira Chance Creation Player Data 21:22.csv")
Liga_Primeira_Possession_Player_Data_21_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/Liga Primeira 21:22/Liga Primeira Possession Player Data 21:22.csv")
Liga_Primeira_Shooting_Player_Data_21_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/Liga Primeira 21:22/Liga Primeira Shooting Player Data 21:22.csv")
Ligue_1_Chance_Creation_Player_Data_21_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/Ligue 1 21:22/Ligue 1 Chance Creation Player Data 21:22.csv")
Ligue_1_Possession_Player_Data_21_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/Ligue 1 21:22/Ligue 1 Possession Player  Data 21:22.csv")
Ligue_1_Shooting_Player_Data_21_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/Ligue 1 21:22/Ligue 1 Shooting Player Data 21:22.csv")
Premier_League_Chance_Creation_Player_Data_21_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/Premier League 21:22/Premier League Chance Creation Player Data 21:22.csv")
Premier_League_Possession_Player_Data_21_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/Premier League 21:22/Premier League Possession Player  Data 21:22.csv")
Premier_League_Shooting_Data_21_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/Premier League 21:22/Premier League Shooting Data 21:22.csv")
Serie_A_Chance_Creation_Player_Data_21_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/Serie A 21:22/Serie A Chance Creation Player Data 21:22.csv")
Serie_A_Possession_Player_Data_21_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/Serie A 21:22/Serie A Possession Player Data 21:22.csv")
Serie_A_Shooting_Player_Data_21_22 <- read_csv("Soccer Scouting Data Sets/Soccer Scouting Project/Serie A 21:22/Serie A Shooting Player Data 21:22.csv")
})
# 2.) Create 3 large datasets based on the 3 stat sheets
PossessionData <- rbind(Brasil_Serie_A_Possession_Player_Data_22, Bundesliga_Possession_Player_Data_21_22, Eridivisie_Possession_Player_Data_21_22, La_Liga_Possession_Player_Data_21_22, Liga_Primeira_Possession_Player_Data_21_22, Ligue_1_Possession_Player_Data_21_22, Premier_League_Possession_Player_Data_21_22, Serie_A_Possession_Player_Data_21_22)
ChanceCreationData <- rbind(Brasil_Serie_A_Chance_Creation_Player_Data_22, Bundesliga_Chance_Creation_Player_Data_21_22, Eridivisie_Chance_Creation_Player_Data_21_22, La_Liga_Chance_Creation_Player_Data_21_22, Liga_Primeira_Chance_Creation_Player_Data_21_22, Ligue_1_Chance_Creation_Player_Data_21_22, Premier_League_Chance_Creation_Player_Data_21_22, Serie_A_Chance_Creation_Player_Data_21_22)
ShootingData <- rbind(Brasil_Serie_A_Shooting_Player_Data_22, Bundesliga_Shooting_Player_Data_21_22, Eridivisie_Shooting_Player_Data_21_22, La_Liga_Shooting_Player_Data_21_22, Liga_Primeira_Shooting_Player_Data_21_22, Ligue_1_Shooting_Player_Data_21_22, Premier_League_Shooting_Data_21_22, Serie_A_Shooting_Player_Data_21_22)
# 3.) Modify data frames based off certain parameters
# - Basic Parameters - Age < 27, Position = FW
# - Shooting Data
install.packages("dplyr")
colnames(ShootingData) <- as.character(ShootingData[1,])
ShootingData <- ShootingData[-1,]
ShootingData$Age <- as.numeric(ShootingData$Age)
ShootingDataFiltered1 <- subset(ShootingData, Age < 27)
ShootingDataFiltered2 <- subset(ShootingDataFiltered1, Pos == "FW" | Pos == "MFFW" | Pos == "FWMF")
# - Chance Creation Data
colnames(ChanceCreationData) <- as.character(ChanceCreationData[1,])
ChanceCreationData <- ChanceCreationData[-1,]
ChanceCreationData$Age <- as.numeric(ChanceCreationData$Age)
ChanceCreationDataFiltered1 <- subset(ChanceCreationData, Age < 27)
ChanceCreationDataFiltered2 <- subset(ChanceCreationDataFiltered1, Pos == "FW" | Pos == "MFFW" | Pos == "FWMF")
# - Possession Stats
colnames(PossessionData) <- as.character(PossessionData[1,])
PossessionData <- PossessionData[-1,]
PossessionData$Age <- as.numeric(PossessionData$Age)
PossessionDataFiltered1 <- subset(PossessionData, Age < 27)
PossessionDataFiltered2 <- subset(PossessionDataFiltered1, Pos == "FW" | Pos == "MFFW" | Pos == "FWMF")
# 4.) From these players, find the top performers in certain categories
# - Shooting Stats
ShootingDataFiltered2$Gls <- as.numeric(ShootingDataFiltered2$Gls)
GlsSubset <- ShootingDataFiltered2[ShootingDataFiltered2$Gls>quantile(ShootingDataFiltered2$Gls,0.75),]
ShootingDataFiltered2$Sh <- as.numeric(ShootingDataFiltered2$Sh)
ShSubset <- ShootingDataFiltered2[ShootingDataFiltered2$Sh>quantile(ShootingDataFiltered2$Sh,0.75),]
colnames(ShootingDataFiltered2)[12] ="SoTPercentage"
ShootingDataFiltered2$SoTPercentage <- as.numeric(ShootingDataFiltered2$SoTPercentage)
SoTPercentageSubset <- ShootingDataFiltered2[!(is.na(ShootingDataFiltered2$SoTPercentage)), ]
SoTPercentageSubset <- SoTPercentageSubset[SoTPercentageSubset$SoTPercentage>quantile(SoTPercentageSubset$SoTPercentage,0.5),]
# - Chance Creation Stats
ChanceCreationDataFiltered2 <- ChanceCreationDataFiltered2[!(is.na(ChanceCreationDataFiltered2$GCA)), ]
ChanceCreationDataFiltered2$GCA <- as.numeric(ChanceCreationDataFiltered2$GCA)
GCASubset <- ChanceCreationDataFiltered2[ChanceCreationDataFiltered2$GCA>quantile(ChanceCreationDataFiltered2$GCA,0.75),]
ChanceCreationDataFiltered2 <- ChanceCreationDataFiltered2[!(is.na(ChanceCreationDataFiltered2$GCA90)), ]
ChanceCreationDataFiltered2$GCA90 <- as.numeric(ChanceCreationDataFiltered2$GCA90)
GCA90Subset <- ChanceCreationDataFiltered2[ChanceCreationDataFiltered2$GCA90>quantile(ChanceCreationDataFiltered2$GCA90,0.75),]
# - Possession Stats
PossessionDataFiltered2 <- PossessionDataFiltered2[!(is.na(PossessionDataFiltered2$Succ)), ]
PossessionDataFiltered2$Succ <- as.numeric(PossessionDataFiltered2$Succ)
SuccSubset <- PossessionDataFiltered2[PossessionDataFiltered2$Succ>quantile(PossessionDataFiltered2$Succ,0.75),]
colnames(PossessionDataFiltered2)[18] ="SuccPercantage"
PossessionDataFiltered2 <- PossessionDataFiltered2[!(is.na(PossessionDataFiltered2$SuccPercantage)), ]
PossessionDataFiltered2$SuccPercantage <- as.numeric(PossessionDataFiltered2$SuccPercantage)
SuccPercantageSubset <- PossessionDataFiltered2[PossessionDataFiltered2$SuccPercantage>quantile(PossessionDataFiltered2$SuccPercantage,0.75),]
PossessionDataFiltered2 <- PossessionDataFiltered2[!(is.na(PossessionDataFiltered2$PrgC)), ]
PossessionDataFiltered2$PrgC <- as.numeric(PossessionDataFiltered2$PrgC)
PrgCSubset <- PossessionDataFiltered2[PossessionDataFiltered2$PrgC>quantile(PossessionDataFiltered2$PrgC,0.75),]
# 5.) Create a data frame with players that appear on all of the statistical subsets
Ballers <- list(GlsSubset, ShSubset, SoTPercentageSubset, GCASubset, GCA90Subset, SuccSubset, SuccPercantageSubset, PrgCSubset)
TopBallers <- Reduce(function(x, y) merge(x, y, by = "Player"), Ballers)
TopBallers[2,"Player"] <- "Andre Silva 2"
UniqueTopBallers<-unique(TopBallers$Player)
print(UniqueTopBallers)

