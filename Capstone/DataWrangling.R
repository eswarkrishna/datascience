##importing libraries
library(dplyr)
setwd("C:\\Users\\neoistheone\\Documents\\Capstone\\DISE")

# Cleaning data
basicData_13_14 <- read.csv("DRC_Raw_Data_13_14_1.csv")
basicData_13_14 <-slice(basicData_13_14,11:674)
basicData_13_14 <- sapply(basicData_13_14, as.character)
colnames(basicData_13_14) <- c(basicData_13_14[2,])
basicData_13_14 <- as.data.frame(basicData_13_14[-(1:2),])
# Cleaning data

#removed columns
basicData_13_14$p_06_pop <- NULL
basicData_13_14$sexratio_06 <- NULL
#add columns
basicData_13_14 <- cbind(Year=2014,basicData_13_14)
basicData_13_14 <- basicData_13_14[-c(18:165)]
head(basicData_13_14)
#completely cleaned basic  data

#school data
schoolData_13_14 <- read.csv("DRC_Raw_Data_13_14_2.csv")
schoolData_13_14 <- slice(schoolData_13_14,22:3773)
schoolData_13_14 <- slice(schoolData_13_14,1:664)
colnamesFinal_13_14  <- schoolData_13_14[2,6:229]
colnamesFinal_13_14 <-colnamesFinal_13_14[!is.na(colnamesFinal_13_14)]
colnamesInitial_13_14 <- c('statecd','statename','distcd','distname','Year')
colnames(schoolData_13_14) <-c( colnamesInitial_13_14,colnamesFinal_13_14)
schooldescription_13_14 <- schoolData_13_14[1:2,]
schoolData_13_14 <- as.data.frame(schoolData_13_14[-(1:2),])
schoolData_13_14$Year <- 2014
schoolData_13_14 <- as.data.frame(schoolData_13_14[,1:229])
#completed cleaned School Data

# enrollment data
enrollmentData_13_14 <- read.csv("DRC_Raw_Data_13_14_3.csv")
enrollmentData_13_14 <- slice(enrollmentData_13_14,16:3764)
enrollmentData_13_14 <- slice(enrollmentData_13_14,1:664)
colnamesEnrollmentData_13_14 <- enrollmentData_13_14[2,1:165]
colnamesEnrollmentData_13_14 <- colnamesEnrollmentData_13_14[!is.na(colnamesEnrollmentData_13_14)]
colnames(enrollmentData_13_14) <- c(colnamesEnrollmentData_13_14)
enrollmentDescription_13_14 <- enrollmentData_13_14[1:2,]
enrollmentData_13_14 <- as.data.frame(enrollmentData_13_14[-(1:2),])
enrollmentData_13_14 <- as.data.frame(enrollmentData_13_14[,1:165])
enrollmentData_13_14 <- cbind(Year = 2014,enrollmentData_13_14)
#completely cleaned Enrollment Data

#Teacher data
teacherData_13_14 <- read.csv("DRC_Raw_Data_13_14_4.csv")
teacherData_13_14 <- slice(teacherData_13_14,20:3770)
teacherData_13_14 <- slice(teacherData_13_14,1:664)
colnamesTeachersData_13_14 <- teacherData_13_14[2,1:181]
colnamesTeachersData_13_14 <- colnamesTeachersData_13_14[!is.na(colnamesTeachersData_13_14)]
colnames(teacherData_13_14) <- c(colnamesTeachersData_13_14)
teacherDescription_13_14 <- teacherData_13_14[1:2,]
teacherData_13_14 <- as.data.frame(teacherData_13_14[-(1:2),])
teacherData_13_14$Year <- teacherData_13_14$ac_year
teacherData_13_14$ac_year <- NULL
teacherData_13_14$Year <- 2014
#Completely Cleaned Teacher data

#First File completed 2013-14

#Second File Cleaning started 2012-13
# Cleaning data
basicData_12_13 <- read.csv("DRC_Raw_Data_12_13_1.csv")
basicData_12_13 <-slice(basicData_12_13,11:674)
basicData_12_13 <- sapply(basicData_12_13, as.character)
colnames(basicData_12_13) <- c(basicData_12_13[2,])
basicData_12_13 <- as.data.frame(basicData_12_13[-(1:2),])
# Cleaning data

#removed columns
basicData_12_13$p_06_pop <- NULL
basicData_12_13$sexratio_06 <- NULL
#add columns
basicData_12_13 <- cbind(Year=2013,basicData_12_13)
basicData_12_13 <- basicData_12_13[-c(18:165)]
head(basicData_12_13)
#completely cleaned basic  data

#school data
schoolData_12_13 <- read.csv("DRC_Raw_Data_12_13_2.csv")
schoolData_12_13 <- slice(schoolData_12_13,22:3773)
schoolData_12_13 <- slice(schoolData_12_13,1:664)
colnamesFinal_12_13  <- schoolData_12_13[2,6:229]
colnamesFinal_12_13 <-colnamesFinal_12_13[!is.na(colnamesFinal_12_13)]
colnamesInitial_12_13 <- c('statecd','statename','distcd','distname','Year')
colnames(schoolData_12_13) <-c( colnamesInitial_12_13,colnamesFinal_12_13)
schooldescription_12_13 <- schoolData_12_13[1:2,]
schoolData_12_13 <- as.data.frame(schoolData_12_13[-(1:2),])
schoolData_12_13$Year <- 2013
schoolData_12_13 <- as.data.frame(schoolData_12_13[,1:229])
#completed cleaned School Data

# enrollment data
enrollmentData_12_13 <- read.csv("DRC_Raw_Data_12_13_3.csv")
enrollmentData_12_13 <- slice(enrollmentData_12_13,16:3764)
enrollmentData_12_13 <- slice(enrollmentData_12_13,1:664)
colnamesenrollmentData_12_13 <- enrollmentData_12_13[2,1:165]
colnamesenrollmentData_12_13 <- colnamesenrollmentData_12_13[!is.na(colnamesenrollmentData_12_13)]
colnames(enrollmentData_12_13) <- c(colnamesenrollmentData_12_13)
enrollmentDescription_12_13 <- enrollmentData_12_13[1:2,]
enrollmentData_12_13 <- as.data.frame(enrollmentData_12_13[-(1:2),])
enrollmentData_12_13 <- as.data.frame(enrollmentData_12_13[,1:165])
enrollmentData_12_13 <- cbind(Year = 2013,enrollmentData_12_13)
#completely cleaned Enrollment Data

#Teacher data
teacherData_12_13 <- read.csv("DRC_Raw_Data_12_13_4.csv")
teacherData_12_13 <- slice(teacherData_12_13,19:3770)
teacherData_12_13 <- slice(teacherData_12_13,1:664)
colnamesTeachersData_12_13 <- teacherData_12_13[2,1:181]
colnamesTeachersData_12_13 <- colnamesTeachersData_12_13[!is.na(colnamesTeachersData_12_13)]
colnames(teacherData_12_13) <- c(colnamesTeachersData_12_13)
teacherDescription_12_13 <- teacherData_12_13[1:2,]
teacherData_12_13 <- as.data.frame(teacherData_12_13[-(1:2),])
teacherData_12_13$Year <- teacherData_12_13$ac_year
teacherData_12_13$ac_year <- NULL
teacherData_12_13$Year <- 2013
#Completely Cleaned Teacher data
#Completed cleaneda data for the year 2012-13


#Second File Cleaning started 2011-12
# Cleaning data
basicData_11_12 <- read.csv("DRC_Raw_Data_11_12_1.csv")
basicData_11_12 <-slice(basicData_11_12,11:674)
basicData_11_12 <- sapply(basicData_11_12, as.character)
colnames(basicData_11_12) <- c(basicData_11_12[2,])
basicData_11_12 <- as.data.frame(basicData_11_12[-(1:2),])
# Cleaning data

#removed columns
basicData_11_12$p_06_pop <- NULL
basicData_11_12$sexratio_06 <- NULL
#add columns
basicData_11_12 <- cbind(Year=2012,basicData_11_12)
basicData_11_12 <- basicData_11_12[-c(18:165)]
head(basicData_11_12)
#completely cleaned basic  data

##TODO issue in school data
#school data
schoolData_11_12 <- read.csv("DRC_Raw_Data_11_12_2.csv")
schoolData_11_12 <- slice(schoolData_11_12,22:3773)
colnameschoolData_11_12 <- schoolData_11_12[2,1:203]
colnames(schoolData_11_12) <- c(colnameschoolData_11_12)
schooldescription_11_12 <- schoolData_11_12[1:2,]
schoolData_11_12 <- as.data.frame(schoolData_11_12[-(1:2),])
schoolData_11_12 <- as.data.frame(schoolData_11_12[,1:203])
#Not completed cleaned School Data

# enrollment data
enrollmentData_11_12 <- read.csv("DRC_Raw_Data_11_12_3.csv")
enrollmentData_11_12 <- slice(enrollmentData_11_12,16:3764)
enrollmentData_11_12 <- slice(enrollmentData_11_12,1:664)
colnamesenrollmentData_11_12 <- enrollmentData_11_12[2,1:161]
colnamesenrollmentData_11_12 <- colnamesenrollmentData_11_12[!is.na(colnamesenrollmentData_11_12)]
colnames(enrollmentData_11_12) <- c(colnamesenrollmentData_11_12)
enrollmentDescription_11_12 <- enrollmentData_11_12[1:2,]
enrollmentData_11_12 <- as.data.frame(enrollmentData_11_12[-(1:2),])
enrollmentData_11_12 <- as.data.frame(enrollmentData_11_12[,1:161])
enrollmentData_11_12 <- cbind(Year = 2012,enrollmentData_11_12)
#completely cleaned Enrollment Data

#Teacher data
teacherData_11_12 <- read.csv("DRC_Raw_Data_11_12_4.csv")
teacherData_11_12 <- slice(teacherData_11_12,19:3770)
teacherData_11_12 <- slice(teacherData_11_12,1:664)
colnamesTeachersData_11_12 <- teacherData_11_12[2,1:134]
colnamesTeachersData_11_12 <- colnamesTeachersData_11_12[!is.na(colnamesTeachersData_11_12)]
colnames(teacherData_11_12) <- c(colnamesTeachersData_11_12)
teacherDescription_11_12 <- teacherData_11_12[1:2,]
teacherData_11_12 <- as.data.frame(teacherData_11_12[-(1:2),])
teacherData_11_12 <- as.data.frame(teacherData_11_12[,1:134])
teacherData_11_12$Year <- teacherData_11_12$ac_year
teacherData_11_12$ac_year <- NULL
teacherData_11_12$Year <- 2012
#Completely Cleaned Teacher data


colnames(basicData_12_13) <- tolower(colnames(basicData_12_13))
colnames(basicData_13_14) <- tolower(colnames(basicData_13_14))
basicDataConsolidated <- rbind(basicData_12_13,basicData_13_14)

colnames(schoolData_12_13) <- tolower(colnames(schoolData_12_13))
colnames(schoolData_13_14) <- tolower(colnames(schoolData_13_14))


View(enrollmentData_12_13)
View(enrollmentData_13_14)
basicEnrollmentDataConsolidated <- rbind(enrollmentData_12_13,enrollmentData_13_14)

#some data is lost in this merge
cols <- intersect(colnames(schoolData_12_13),colnames(schoolData_13_14))
basicSchoolDataConsolidated <- rbind(schoolData_12_13[,cols],schoolData_13_14[,cols])
##

View(teacherData_12_13)
View(teacherData_13_14)
teacherdataConsolidated <- rbind(teacherData_12_13,teacherData_13_14)

write.csv(basicDataConsolidated,file = "basicData.csv")
