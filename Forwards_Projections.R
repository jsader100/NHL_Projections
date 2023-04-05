library(dplyr)

bios_2018 <- read.csv("Data/Bios_2018.csv")
bios_2019 <- read.csv("Data/Bios_2019.csv")
bios_2020 <- read.csv("Data/Bios_2020.csv")
bios_2021 <- read.csv("Data/Bios_2021.csv")
bios_2022 <- read.csv("Data/Bios_2022.csv")

as_2018 <- select(read.csv("Data/AS_2018.csv"), c("Player", "Position", "GP", "TOI", "Goals", "A"="Total.Assists", "A1"="First.Assists", "A2"="Second.Assists", "S"="Shots", "SP" = "SH.", "xG"="ixG", "Hits", "Blocks"="Shots.Blocked"))
as_2019 <- select(read.csv("Data/AS_2019.csv"), c("Player", "Position", "GP", "TOI", "Goals", "A"="Total.Assists", "A1"="First.Assists", "A2"="Second.Assists", "S"="Shots", "SP" = "SH.", "xG"="ixG", "Hits", "Blocks"="Shots.Blocked"))
as_2020 <- select(read.csv("Data/AS_2020.csv"), c("Player", "Position", "GP", "TOI", "Goals", "A"="Total.Assists", "A1"="First.Assists", "A2"="Second.Assists", "S"="Shots", "SP" = "SH.", "xG"="ixG", "Hits", "Blocks"="Shots.Blocked"))
as_2021 <- select(read.csv("Data/AS_2021.csv"), c("Player", "Position", "GP", "TOI", "Goals", "A"="Total.Assists", "A1"="First.Assists", "A2"="Second.Assists", "S"="Shots", "SP" = "SH.", "xG"="ixG", "Hits", "Blocks"="Shots.Blocked"))
as_2022 <- select(read.csv("Data/AS_2022.csv"), c("Player", "Position", "GP", "TOI", "Goals", "A"="Total.Assists", "A1"="First.Assists", "A2"="Second.Assists", "S"="Shots", "SP" = "SH.", "xG"="ixG", "Hits", "Blocks"="Shots.Blocked"))

bios_list <- list(bios_2018, bios_2019, bios_2020, bios_2021, bios_2022)
as_list <- list(as_2018, as_2019, as_2020, as_2021, as_2022)

View

for(i in seq_along(as_list)){
    df <- select(bios_list[[i]], c("Player", "Date.of.Birth"))
    df2 <- as_list[[i]]
    as_list[[i]] <- merge(df, df2, by="Player")
}

View(as_list[[1]])