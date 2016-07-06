#importing libraries
library(dplyr)
setwd("C:\\Users\\neoistheone\\Documents\\Capstone\\DISE")

# Cleaning data
basicData <- read.csv("DRC_Raw_Data_13_14_1.csv")
basicData <-slice(basicData,11:674)
basicData <- sapply(basicData, as.character)
colnames(basicData) <- c(basicData[2,])
basicData <- as.data.frame(basicData[-(1:2),])
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
colnamesFinal  <- schoolData[2,6:229]
colnamesFinal <-colnamesFinal[!is.na(colnamesFinal)]
colnamesInitial <- c('statecd','statename','distcd','distname','Year')
colnames(schoolData) <-c( colnamesInitial,colnamesFinal)
schooldescription <- schoolData[1:2,]
schoolData <- as.data.frame(schoolData[-(1:2),])
schoolData$Year <- 2014
schoolData <- as.data.frame(schoolData[,1:229])
#completed cleaned School Data

# enrollment data
enrollmentData <- read.csv("DRC_Raw_Data_13_14_3.csv")
enrollmentData <- slice(enrollmentData,16:3764)
enrollmentData <- slice(enrollmentData,1:664)
colnamesEnrollmentData <- enrollmentData[2,1:165]
colnamesEnrollmentData <- colnamesEnrollmentData[!is.na(colnamesEnrollmentData)]
colnames(enrollmentData) <- c(colnamesEnrollmentData)
enrollmentDescription <- enrollmentData[1:2,]
enrollmentData <- as.data.frame(enrollmentData[-(1:2),])
enrollmentData <- as.data.frame(enrollmentData[,1:165])
#completely cleaned Enrollment Data

#Teacher data
teacherData <- read.csv("DRC_Raw_Data_13_14_4.csv")
teacherData <- slice(teacherData,20:3770)
teacherData <- slice(teacherData,1:664)
colnamesTeachersData <- teacherData[2,1:181]
colnamesTeachersData <- colnamesTeachersData[!is.na(colnamesTeachersData)]
colnames(teacherData) <- c(colnamesTeachersData)
teacherDescription <- teacherData[1:2,]
teacherData <- as.data.frame(teacherData[-(1:2),])
#Completely Cleaned Teacher data

