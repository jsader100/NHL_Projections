
library(dplyr)

###
### Reading files from data folder
###

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

pp_2018 <- select(read.csv("Data/PP_2018.csv"), c("Player", "PP.TOI"="TOI","PP.G"="Goals", "PP.S"="Shots", "PP.xG"="ixG"))
pp_2019 <- select(read.csv("Data/PP_2019.csv"), c("Player", "PP.TOI"="TOI","PP.G"="Goals", "PP.S"="Shots", "PP.xG"="ixG"))
pp_2020 <- select(read.csv("Data/PP_2020.csv"), c("Player", "PP.TOI"="TOI","PP.G"="Goals", "PP.S"="Shots", "PP.xG"="ixG"))
pp_2021 <- select(read.csv("Data/PP_2021.csv"), c("Player", "PP.TOI"="TOI","PP.G"="Goals", "PP.S"="Shots", "PP.xG"="ixG"))
pp_2022 <- select(read.csv("Data/PP_2022.csv"), c("Player", "PP.TOI"="TOI","PP.G"="Goals", "PP.S"="Shots", "PP.xG"="ixG"))

###
### Creating lists of dataframes and then merging them
###

bios_list <- list(bios_2018, bios_2019, bios_2020, bios_2021, bios_2022)
as_list <- list(as_2018, as_2019, as_2020, as_2021, as_2022)
pp_list <- list(pp_2018, pp_2019, pp_2020, pp_2021, pp_2022)
all_list <- list()

# Adding Player Age to bios dfs
bios_list <- lapply(seq_along(bios_list), function (i){
    bios_list[[i]] %>%
      mutate(Season = as.integer(2017 + i),
             Age = as.integer(2017 + i) - strtoi(substr(Date.of.Birth, 1, 4)))
})


# Merging all together
for(i in seq_along(as_list)){
    df <- select(bios_list[[i]], c("Player", "Date.of.Birth"))
    df2 <- as_list[[i]]
    df3 <- pp_list[[i]]
    df4 <- merge(df, df2, by="Player")
    all_list[[i]] <- merge(df4, pp_list[[i]])
}




View(all_list[[1]])