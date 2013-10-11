# Data aggregation by region

# Setting the working directory
setwd("C:/work/R/examples")

# Reading the CSV file into the object named source
source <- read.csv("c:/work/R/examples/outlook.csv",header=TRUE)

# Create an object with param == 2_Popul
pop <- subset(source,param == "2_Popul")

# Create a region-to-group mapping table
map <- data.frame(
         region = c("ANZ","USA","CAN","JPN","EUR",  "RUS","BRA","MEX","CHN","IND","ASI",   "AFR","LAM","MES","REA","ROE"),
         group  = c(rep("Developed",5),              rep("Other G20",6),                    rep("Rest of World",5))  
                  )

# Merge the object pop with the object map
pop <- merge(pop, map, by="region", all=TRUE, sort=FALSE)

# Sum up values for a given year within the same group
pop_group <- aggregate(pop$value, by=list(pop$year,pop$group), FUN=sum)

# Writing the object pop into a CSV file named MyData.csv without the default row labels
write.csv(pop_group, file = "c:/work/R/examples/MyData.csv",row.names=FALSE)

