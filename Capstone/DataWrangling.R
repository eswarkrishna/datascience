#importing libraries
library(dplyr)
setwd("C:\\Users\\neoistheone\\Documents\\Capstone\\DISE")

# Cleaning data
basicData <- read.csv("DRC_Raw_Data_13_14_1.csv")
basicData <-slice(basicData,11:674)
basicData <- sapply(basicData, as.character)
colnames(basicData) <- c(basicData[2,])
basicData <- as.data.frame(basicData[-1,])
basicData <- as.data.frame(basicData[-1,])
# Cleaning data
#removed columns
basicData$p_06_pop <- NULL
basicData$sexratio_06 <- NULL
#add columns
basicData <- cbind(Year=2014,basicData)
basicData <- basicData[-c(18:165)]
head(basicData)
#completely cleaned basic  data

#school data
schoolData <- read.csv("DRC_Raw_Data_13_14_2.csv")
schoolData <- slice(schoolData,22:3773)
schoolData <- slice(schoolData,1:664)

#Teacher data
enrollmentData <- read.csv("DRC_Raw_Data_13_14_3.csv")
enrollmentData <- slice(enrollmentData,16:3764)
enrollmentData <- slice(enrollmentData,1:664)

# enrollment data
teacherData <- read.csv("DRC_Raw_Data_13_14_4.csv")
teacherData <- slice(teacherData,20:3770)
teacherData <- slice(teacherData,1:664)

