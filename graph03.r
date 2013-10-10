# Setting the working directory
setwd("C:/work/R/examples")

# Reading the CSV file into the object named source
source <- read.csv("c:/work/R/examples/outlook.csv",header=TRUE)

# Create an object with param == 2_Popul
pop=subset(source,param == "2_Popul")

# Create objects which are subsets of pop
pop_anz=subset(pop,region=="ANZ")
pop_usa=subset(pop,region=="USA")
pop_can=subset(pop,region=="CAN")
pop_jpn=subset(pop,region=="JPN")
pop_eur=subset(pop,region=="EUR")

# Drop the column value and replace the region content by "Developed"
pop_attr=pop_usa[ , -which(names(pop) %in% c("region","value"))]
pop_attr$region <- "Developed"

# Drop all columns except for the column "value"
pop_anz=pop_anz[ , -which(names(pop_anz) %in% c("param","region","year"))]
pop_usa=pop_usa[ , -which(names(pop_usa) %in% c("param","region","year"))]
pop_can=pop_can[ , -which(names(pop_can) %in% c("param","region","year"))]
pop_jpn=pop_jpn[ , -which(names(pop_jpn) %in% c("param","region","year"))]
pop_eur=pop_eur[ , -which(names(pop_eur) %in% c("param","region","year"))]

# Sum over these five countries
value=pop_anz+pop_usa+pop_can+pop_jpn+pop_eur

# Combine pop_attr with value
pop_developed=cbind(pop_attr,value)

# Writing the object pop into a CSV file named MyData.csv without the default row labels
write.csv(pop_developed, file = "c:/work/R/examples/MyData.csv",row.names=FALSE)

