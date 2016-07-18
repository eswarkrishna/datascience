##importing libraries
library(dplyr)
library(reshape)
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

corrplotData <- basicDataConsolidated
corrplotData$blocks <- as.numeric(corrplotData$blocks)
corrplotData$clusters <- as.numeric(corrplotData$clusters)
corrplotData$villages <- as.numeric(corrplotData$villages)
corrplotData$totschools <- as.numeric(corrplotData$totschools)
corrplotData$totpopulation <- as.numeric(corrplotData$totpopulation)
corrplotData$p_urb_pop <- as.numeric(corrplotData$p_urb_pop)
corrplotData$sexratio <- as.numeric(corrplotData$sexratio)
corrplotData$growthrate <- as.numeric(corrplotData$growthrate)
corrplotData$p_sc_pop <- as.numeric(corrplotData$p_sc_pop)
corrplotData$p_st_pop <- as.numeric(corrplotData$p_st_pop)
corrplotData$overall_lit <- as.numeric(corrplotData$overall_lit)
corrplotData$female_lit <- as.numeric(corrplotData$female_lit)

cor(corrplotData[,6:17])
### No Multi collinearity problem in this fields. Overall literacy and Female literacy are highly correlated

colnames(schoolData_12_13) <- tolower(colnames(schoolData_12_13))
colnames(schoolData_13_14) <- tolower(colnames(schoolData_13_14))


View(enrollmentData_12_13)
View(enrollmentData_13_14)
basicEnrollmentDataConsolidated <- rbind(enrollmentData_12_13,enrollmentData_13_14)

#some data is lost in this merge
cols <- intersect(colnames(schoolData_12_13),colnames(schoolData_13_14))
basicSchoolDataConsolidated <- rbind(schoolData_12_13[,cols],schoolData_13_14[,cols])
basicSchoolDataConsolidated$schgovt_total <- as.numeric(basicSchoolDataConsolidated$schgovt1)+
  as.numeric(basicSchoolDataConsolidated$schgovt2)+as.numeric(basicSchoolDataConsolidated$schgovt3)+as.numeric(basicSchoolDataConsolidated$schgovt4)+
  as.numeric(basicSchoolDataConsolidated$schgovt5)+as.numeric(basicSchoolDataConsolidated$schgovt6)+as.numeric(basicSchoolDataConsolidated$schgovt7)+
  as.numeric(basicSchoolDataConsolidated$schgovt9)
basicSchoolDataConsolidated$schgovt1<- NULL
basicSchoolDataConsolidated$schgovt2<- NULL
basicSchoolDataConsolidated$schgovt3<- NULL
basicSchoolDataConsolidated$schgovt4<- NULL
basicSchoolDataConsolidated$schgovt5<- NULL
basicSchoolDataConsolidated$schgovt6<- NULL
basicSchoolDataConsolidated$schgovt7<- NULL
basicSchoolDataConsolidated$schgovt9<- NULL

basicSchoolDataConsolidated$schpvt_total <- as.numeric(basicSchoolDataConsolidated$schpvt1)+as.numeric(basicSchoolDataConsolidated$schpvt2)+
  as.numeric(basicSchoolDataConsolidated$schpvt3)+as.numeric(basicSchoolDataConsolidated$schpvt4)+as.numeric(basicSchoolDataConsolidated$schpvt5)
+as.numeric(basicSchoolDataConsolidated$schpvt6)
+as.numeric(basicSchoolDataConsolidated$schpvt7)+as.numeric(basicSchoolDataConsolidated$schpvt9)
basicSchoolDataConsolidated$schpvt1 <- NULL
basicSchoolDataConsolidated$schpvt2 <- NULL
basicSchoolDataConsolidated$schpvt3 <- NULL
basicSchoolDataConsolidated$schpvt4 <- NULL
basicSchoolDataConsolidated$schpvt5 <- NULL
basicSchoolDataConsolidated$schpvt6 <- NULL
basicSchoolDataConsolidated$schpvt7 <- NULL
basicSchoolDataConsolidated$schpvt9 <- NULL

basicSchoolDataConsolidated$`sch_r_govt_total` <- as.numeric(basicSchoolDataConsolidated$`sch r govt1`)+as.numeric(basicSchoolDataConsolidated$`sch r govt2`)+as.numeric(basicSchoolDataConsolidated$`sch r govt3`)+
  as.numeric(basicSchoolDataConsolidated$`sch r govt4`)+as.numeric(basicSchoolDataConsolidated$`sch r govt5`)+ as.numeric(basicSchoolDataConsolidated$`sch r govt6`)+as.numeric(basicSchoolDataConsolidated$`sch r govt7`)+
  as.numeric(basicSchoolDataConsolidated$`sch r govt9`)

basicSchoolDataConsolidated$`sch r govt1` <- NULL
basicSchoolDataConsolidated$`sch r govt2` <- NULL
basicSchoolDataConsolidated$`sch r govt3` <- NULL
basicSchoolDataConsolidated$`sch r govt4` <- NULL
basicSchoolDataConsolidated$`sch r govt5` <- NULL
basicSchoolDataConsolidated$`sch r govt6` <- NULL
basicSchoolDataConsolidated$`sch r govt7` <- NULL
basicSchoolDataConsolidated$`sch r govt9` <- NULL

basicSchoolDataConsolidated$`sch_r_pvt_total` <- as.numeric(basicSchoolDataConsolidated$`sch r pvt1`)+
as.numeric(basicSchoolDataConsolidated$`sch r pvt2`)+
as.numeric(basicSchoolDataConsolidated$`sch r pvt3`)+
as.numeric(basicSchoolDataConsolidated$`sch r pvt4`)+
as.numeric(basicSchoolDataConsolidated$`sch r pvt5`)+
as.numeric(basicSchoolDataConsolidated$`sch r pvt6`)+
as.numeric(basicSchoolDataConsolidated$`sch r pvt7`)+
as.numeric(basicSchoolDataConsolidated$`sch r pvt9`)

basicSchoolDataConsolidated$`sch r pvt1` <- NULL
basicSchoolDataConsolidated$`sch r pvt2` <- NULL
basicSchoolDataConsolidated$`sch r pvt3` <- NULL
basicSchoolDataConsolidated$`sch r pvt4` <- NULL
basicSchoolDataConsolidated$`sch r pvt5` <- NULL
basicSchoolDataConsolidated$`sch r pvt6` <- NULL
basicSchoolDataConsolidated$`sch r pvt7` <- NULL
basicSchoolDataConsolidated$`sch r pvt9` <- NULL

basicSchoolDataConsolidated$`cls1 school1` <- NULL
basicSchoolDataConsolidated$`cls1 school2` <- NULL
basicSchoolDataConsolidated$`cls1 school3` <- NULL
basicSchoolDataConsolidated$`cls1 school4` <- NULL
basicSchoolDataConsolidated$`cls1 school5` <- NULL
basicSchoolDataConsolidated$`cls1 school6` <- NULL
basicSchoolDataConsolidated$`cls1 school7` <- NULL

basicSchoolDataConsolidated$`tch1 school1` <-NULL
basicSchoolDataConsolidated$`tch1 school2` <-NULL
basicSchoolDataConsolidated$`tch1 school3` <-NULL
basicSchoolDataConsolidated$`tch1 school4` <-NULL
basicSchoolDataConsolidated$`tch1 school5` <-NULL
basicSchoolDataConsolidated$`tch1 school6` <-NULL
basicSchoolDataConsolidated$`tch1 school7` <-NULL

basicSchoolDataConsolidated$`pp sch1` <- NULL
basicSchoolDataConsolidated$`pp sch2` <- NULL
basicSchoolDataConsolidated$`pp sch3` <- NULL
basicSchoolDataConsolidated$`pp sch6` <- NULL

basicSchoolDataConsolidated$`gtoilet sch1` <- NULL
basicSchoolDataConsolidated$`gtoilet sch2` <- NULL
basicSchoolDataConsolidated$`gtoilet sch3` <- NULL
basicSchoolDataConsolidated$`gtoilet sch4` <- NULL
basicSchoolDataConsolidated$`gtoilet sch5` <- NULL
basicSchoolDataConsolidated$`gtoilet sch6` <- NULL
basicSchoolDataConsolidated$`gtoilet sch7` <- NULL

basicSchoolDataConsolidated$`water sch1` <- NULL
basicSchoolDataConsolidated$`water sch2` <- NULL
basicSchoolDataConsolidated$`water sch3` <- NULL
basicSchoolDataConsolidated$`water sch4` <- NULL
basicSchoolDataConsolidated$`water sch5` <- NULL
basicSchoolDataConsolidated$`water sch6` <- NULL
basicSchoolDataConsolidated$`water sch7` <- NULL

basicSchoolDataConsolidated$`enr stch sch1` <- NULL
basicSchoolDataConsolidated$`enr stch sch2` <- NULL
basicSchoolDataConsolidated$`enr stch sch3` <- NULL
basicSchoolDataConsolidated$`enr stch sch4` <- NULL
basicSchoolDataConsolidated$`enr stch sch5` <- NULL
basicSchoolDataConsolidated$`enr stch sch6` <- NULL
basicSchoolDataConsolidated$`enr stch sch7` <- NULL

basicSchoolDataConsolidated$`no fem sch1` <- NULL
basicSchoolDataConsolidated$`no fem sch2` <- NULL
basicSchoolDataConsolidated$`no fem sch3` <- NULL
basicSchoolDataConsolidated$`no fem sch4` <- NULL
basicSchoolDataConsolidated$`no fem sch5` <- NULL
basicSchoolDataConsolidated$`no fem sch6` <- NULL
basicSchoolDataConsolidated$`no fem sch7` <- NULL

basicSchoolDataConsolidated$`sch 50enr1` <- NULL
basicSchoolDataConsolidated$`sch 50enr2` <- NULL
basicSchoolDataConsolidated$`sch 50enr3` <- NULL
basicSchoolDataConsolidated$`sch 50enr4` <- NULL
basicSchoolDataConsolidated$`sch 50enr5` <- NULL
basicSchoolDataConsolidated$`sch 50enr6` <- NULL
basicSchoolDataConsolidated$`sch 50enr7` <- NULL

basicSchoolDataConsolidated$`sch since 2003 1_total` <- as.numeric(basicSchoolDataConsolidated$`sch since 2003 1`)+
  as.numeric(basicSchoolDataConsolidated$`sch since 2003 2`)+
  as.numeric(basicSchoolDataConsolidated$`sch since 2003 3`)+
  as.numeric(basicSchoolDataConsolidated$`sch since 2003 4`)+
  as.numeric(basicSchoolDataConsolidated$`sch since 2003 5`)+
  as.numeric(basicSchoolDataConsolidated$`sch since 2003 6`)+
  as.numeric(basicSchoolDataConsolidated$`sch since 2003 7`)

basicSchoolDataConsolidated$`sch since 2003 1` <- NULL
basicSchoolDataConsolidated$`sch since 2003 2` <- NULL
basicSchoolDataConsolidated$`sch since 2003 3` <- NULL
basicSchoolDataConsolidated$`sch since 2003 4` <- NULL
basicSchoolDataConsolidated$`sch since 2003 5` <- NULL
basicSchoolDataConsolidated$`sch since 2003 6` <- NULL
basicSchoolDataConsolidated$`sch since 2003 7` <- NULL

basicSchoolDataConsolidated$kitshed_total <- as.numeric(basicSchoolDataConsolidated$kitshed1)+
  as.numeric(basicSchoolDataConsolidated$kitshed2)+
  as.numeric(basicSchoolDataConsolidated$kitshed3)+
  as.numeric(basicSchoolDataConsolidated$kitshed4)+
  as.numeric(basicSchoolDataConsolidated$kitshed5)+
  as.numeric(basicSchoolDataConsolidated$kitshed6)+
  as.numeric(basicSchoolDataConsolidated$kitshed7)

basicSchoolDataConsolidated$kitshed1 <- NULL
basicSchoolDataConsolidated$kitshed2 <- NULL
basicSchoolDataConsolidated$kitshed3 <- NULL
basicSchoolDataConsolidated$kitshed4 <- NULL
basicSchoolDataConsolidated$kitshed5 <- NULL
basicSchoolDataConsolidated$kitshed6 <- NULL
basicSchoolDataConsolidated$kitshed7 <- NULL


basicSchoolDataConsolidated$`tot cls` <- as.numeric(basicSchoolDataConsolidated$`tot cls1`)+
  as.numeric(basicSchoolDataConsolidated$`tot cls2`)+
  as.numeric(basicSchoolDataConsolidated$`tot cls3`)+
  as.numeric(basicSchoolDataConsolidated$`tot cls4`)+
  as.numeric(basicSchoolDataConsolidated$`tot cls5`)+
  as.numeric(basicSchoolDataConsolidated$`tot cls6`)+
  as.numeric(basicSchoolDataConsolidated$`tot cls7`)

basicSchoolDataConsolidated$`tot cls1` <- NULL
basicSchoolDataConsolidated$`tot cls2` <- NULL
basicSchoolDataConsolidated$`tot cls3` <- NULL
basicSchoolDataConsolidated$`tot cls4` <- NULL
basicSchoolDataConsolidated$`tot cls5` <- NULL
basicSchoolDataConsolidated$`tot cls6` <- NULL
basicSchoolDataConsolidated$`tot cls7` <- NULL

basicSchoolDataConsolidated$`cls good` <- as.numeric(basicSchoolDataConsolidated$`cls good1`)+
  as.numeric(basicSchoolDataConsolidated$`cls good2`)+
  as.numeric(basicSchoolDataConsolidated$`cls good3`)+
  as.numeric(basicSchoolDataConsolidated$`cls good4`)+
  as.numeric(basicSchoolDataConsolidated$`cls good5`)+
  as.numeric(basicSchoolDataConsolidated$`cls good6`)+
  as.numeric(basicSchoolDataConsolidated$`cls good7`)

basicSchoolDataConsolidated$`cls good1` <- NULL
basicSchoolDataConsolidated$`cls good2` <- NULL
basicSchoolDataConsolidated$`cls good3` <- NULL
basicSchoolDataConsolidated$`cls good4` <- NULL
basicSchoolDataConsolidated$`cls good5` <- NULL
basicSchoolDataConsolidated$`cls good6` <- NULL
basicSchoolDataConsolidated$`cls good7` <- NULL


basicSchoolDataConsolidated$`cls major` <- as.numeric(basicSchoolDataConsolidated$`cls major1`)+
  as.numeric(basicSchoolDataConsolidated$`cls major2`)+
  as.numeric(basicSchoolDataConsolidated$`cls major3`)+
  as.numeric(basicSchoolDataConsolidated$`cls major4`)+
  as.numeric(basicSchoolDataConsolidated$`cls major5`)+
  as.numeric(basicSchoolDataConsolidated$`cls major6`)+
  as.numeric(basicSchoolDataConsolidated$`cls major7`)

basicSchoolDataConsolidated$`cls major1` <- NULL
basicSchoolDataConsolidated$`cls major2` <- NULL
basicSchoolDataConsolidated$`cls major3` <- NULL
basicSchoolDataConsolidated$`cls major4` <- NULL
basicSchoolDataConsolidated$`cls major5` <- NULL
basicSchoolDataConsolidated$`cls major6` <- NULL
basicSchoolDataConsolidated$`cls major7` <- NULL


basicSchoolDataConsolidated$`cls minor` <- as.numeric(basicSchoolDataConsolidated$`cls minor1`)+
  as.numeric(basicSchoolDataConsolidated$`cls minor2`)+
  as.numeric(basicSchoolDataConsolidated$`cls minor3`)+
  as.numeric(basicSchoolDataConsolidated$`cls minor4`)+
  as.numeric(basicSchoolDataConsolidated$`cls minor5`)+
  as.numeric(basicSchoolDataConsolidated$`cls minor6`)+
  as.numeric(basicSchoolDataConsolidated$`cls minor7`)

basicSchoolDataConsolidated$`cls minor1` <- NULL
basicSchoolDataConsolidated$`cls minor2` <- NULL
basicSchoolDataConsolidated$`cls minor3` <- NULL
basicSchoolDataConsolidated$`cls minor4` <- NULL
basicSchoolDataConsolidated$`cls minor5` <- NULL
basicSchoolDataConsolidated$`cls minor6` <- NULL
basicSchoolDataConsolidated$`cls minor7` <- NULL

basicSchoolDataConsolidated$`cls other` <- as.numeric(basicSchoolDataConsolidated$`cls other1`)+
  as.numeric(basicSchoolDataConsolidated$`cls other2`)+
  as.numeric(basicSchoolDataConsolidated$`cls other3`)+
  as.numeric(basicSchoolDataConsolidated$`cls other4`)+
  as.numeric(basicSchoolDataConsolidated$`cls other5`)+
  as.numeric(basicSchoolDataConsolidated$`cls other6`)+
  as.numeric(basicSchoolDataConsolidated$`cls other7`)

basicSchoolDataConsolidated$`cls other1` <- NULL
basicSchoolDataConsolidated$`cls other2` <- NULL
basicSchoolDataConsolidated$`cls other3` <- NULL
basicSchoolDataConsolidated$`cls other4` <- NULL
basicSchoolDataConsolidated$`cls other5` <- NULL
basicSchoolDataConsolidated$`cls other6` <- NULL
basicSchoolDataConsolidated$`cls other7` <- NULL

basicSchoolDataConsolidated$`btoilet sch_total` <- as.numeric(basicSchoolDataConsolidated$`btoilet sch1`)+
  as.numeric(basicSchoolDataConsolidated$`btoilet sch2`)+
  as.numeric(basicSchoolDataConsolidated$`btoilet sch3`)+
  as.numeric(basicSchoolDataConsolidated$`btoilet sch4`)+
  as.numeric(basicSchoolDataConsolidated$`btoilet sch5`)+
  as.numeric(basicSchoolDataConsolidated$`btoilet sch6`)+
  as.numeric(basicSchoolDataConsolidated$`btoilet sch7`)

basicSchoolDataConsolidated$`btoilet sch1` <- NULL
basicSchoolDataConsolidated$`btoilet sch2` <- NULL
basicSchoolDataConsolidated$`btoilet sch3` <- NULL
basicSchoolDataConsolidated$`btoilet sch4` <- NULL
basicSchoolDataConsolidated$`btoilet sch5` <- NULL
basicSchoolDataConsolidated$`btoilet sch6` <- NULL
basicSchoolDataConsolidated$`btoilet sch7` <- NULL

basicSchoolDataConsolidated$`electric sch_total` <- as.numeric(basicSchoolDataConsolidated$`electric sch1`)+
  as.numeric(basicSchoolDataConsolidated$`electric sch2`)+
  as.numeric(basicSchoolDataConsolidated$`electric sch3`)+
  as.numeric(basicSchoolDataConsolidated$`electric sch4`)+
  as.numeric(basicSchoolDataConsolidated$`electric sch5`)+
  as.numeric(basicSchoolDataConsolidated$`electric sch6`)+
  as.numeric(basicSchoolDataConsolidated$`electric sch7`)

basicSchoolDataConsolidated$`electric sch1` <- NULL
basicSchoolDataConsolidated$`electric sch2` <- NULL
basicSchoolDataConsolidated$`electric sch3` <- NULL
basicSchoolDataConsolidated$`electric sch4` <- NULL
basicSchoolDataConsolidated$`electric sch5` <- NULL
basicSchoolDataConsolidated$`electric sch6` <- NULL
basicSchoolDataConsolidated$`electric sch7` <- NULL

basicSchoolDataConsolidated$`computer sch_total` <- as.numeric(basicSchoolDataConsolidated$`computer sch1`)+
  as.numeric(basicSchoolDataConsolidated$`computer sch2`)+
  as.numeric(basicSchoolDataConsolidated$`computer sch3`)+
  as.numeric(basicSchoolDataConsolidated$`computer sch4`)+
  as.numeric(basicSchoolDataConsolidated$`computer sch5`)+
  as.numeric(basicSchoolDataConsolidated$`computer sch6`)+
  as.numeric(basicSchoolDataConsolidated$`computer sch7`)

basicSchoolDataConsolidated$`computer sch1` <- NULL
basicSchoolDataConsolidated$`computer sch2` <- NULL
basicSchoolDataConsolidated$`computer sch3` <- NULL
basicSchoolDataConsolidated$`computer sch4` <- NULL
basicSchoolDataConsolidated$`computer sch5` <- NULL
basicSchoolDataConsolidated$`computer sch6` <- NULL
basicSchoolDataConsolidated$`computer sch7` <- NULL

basicSchoolDataConsolidated$mdm_total <- as.numeric(basicSchoolDataConsolidated$`mdm 1`)+
  as.numeric(basicSchoolDataConsolidated$`mdm 2`)+
  as.numeric(basicSchoolDataConsolidated$`mdm 3`)+
  as.numeric(basicSchoolDataConsolidated$`mdm 4`)+
  as.numeric(basicSchoolDataConsolidated$`mdm 5`)+
  as.numeric(basicSchoolDataConsolidated$`mdm 6`)+
  as.numeric(basicSchoolDataConsolidated$`mdm 7`)

basicSchoolDataConsolidated$`mdm 1` <- NULL
basicSchoolDataConsolidated$`mdm 2` <- NULL
basicSchoolDataConsolidated$`mdm 3` <- NULL
basicSchoolDataConsolidated$`mdm 4` <- NULL
basicSchoolDataConsolidated$`mdm 5` <- NULL
basicSchoolDataConsolidated$`mdm 6` <- NULL
basicSchoolDataConsolidated$`mdm 7` <- NULL

basicSchoolDataConsolidated$smc_total <- as.numeric(basicSchoolDataConsolidated$`smc 1`)+
  as.numeric(basicSchoolDataConsolidated$`smc 2`)+
as.numeric(basicSchoolDataConsolidated$`smc 3`)+
  as.numeric(basicSchoolDataConsolidated$`smc 4`)

basicSchoolDataConsolidated$`smc 1` <- NULL
basicSchoolDataConsolidated$`smc 2` <- NULL
basicSchoolDataConsolidated$`smc 3` <- NULL
basicSchoolDataConsolidated$`smc 4` <- NULL

basicSchoolDataConsolidated$sch_un_total <- as.numeric(basicSchoolDataConsolidated$`sch un1`) +
  as.numeric(basicSchoolDataConsolidated$`sch un2`)+
  as.numeric(basicSchoolDataConsolidated$`sch un3`)+
  as.numeric(basicSchoolDataConsolidated$`sch un4`)+
  as.numeric(basicSchoolDataConsolidated$`sch un5`)+
  as.numeric(basicSchoolDataConsolidated$`sch un6`)+
  as.numeric(basicSchoolDataConsolidated$`sch un7`)+
  as.numeric(basicSchoolDataConsolidated$`sch un9`)

basicSchoolDataConsolidated$`sch un1` <- NULL
basicSchoolDataConsolidated$`sch un2` <- NULL
basicSchoolDataConsolidated$`sch un3` <- NULL
basicSchoolDataConsolidated$`sch un4` <- NULL
basicSchoolDataConsolidated$`sch un5` <- NULL
basicSchoolDataConsolidated$`sch un6` <- NULL
basicSchoolDataConsolidated$`sch un7` <- NULL
basicSchoolDataConsolidated$`sch un8` <- NULL
basicSchoolDataConsolidated$`sch un9` <- NULL

basicSchoolDataConsolidated$books_total <- as.numeric(basicSchoolDataConsolidated$`book p b`)+
  as.numeric(basicSchoolDataConsolidated$`book p g`)+
  as.numeric(basicSchoolDataConsolidated$`book up b`)+
  as.numeric(basicSchoolDataConsolidated$`book up g`)

basicSchoolDataConsolidated$`book p b` <- NULL
basicSchoolDataConsolidated$`book p g` <- NULL
basicSchoolDataConsolidated$`book up b` <- NULL
basicSchoolDataConsolidated$`book up g` <- NULL

basicSchoolDataConsolidated$uniform_total <- as.numeric(basicSchoolDataConsolidated$`uniform p b`)+
  as.numeric(basicSchoolDataConsolidated$`uniform p g`)+
  as.numeric(basicSchoolDataConsolidated$`uniform up b`)+
  as.numeric(basicSchoolDataConsolidated$`uniform up g`)

basicSchoolDataConsolidated$`uniform p b` <- NULL
basicSchoolDataConsolidated$`uniform p g` <- NULL
basicSchoolDataConsolidated$`uniform up b` <- NULL
basicSchoolDataConsolidated$`uniform up g`<- NULL

### After aggregation of school data there are 45 columns still few more columns left


##

View(teacherData_12_13)
View(teacherData_13_14)
basicTeacherdataConsolidated <- rbind(teacherData_12_13,teacherData_13_14)

write.csv(basicDataConsolidated,file = "basicData.csv")
