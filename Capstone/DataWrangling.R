##importing libraries
library(dplyr)
library(reshape)
setwd("C:\\Users\\Documents\\Capstone\\DISE")

## Functions
asNumeric <- function(x) as.numeric(as.character(x))
factorsNumeric <- function(d) modifyList(d, lapply(d[, sapply(d, is.factor)],   
                                                   asNumeric))


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

basicTeacherdataConsolidated <- rbind(teacherData_12_13,teacherData_13_14)

basicTeacherdataConsolidated[,5:180]<-factorsNumeric(basicTeacherdataConsolidated[,5:180])

basicTeacherdataConsolidated$tch_govt_total <- basicTeacherdataConsolidated$tch_govt1+
  basicTeacherdataConsolidated$tch_govt2+
  basicTeacherdataConsolidated$tch_govt3+
  basicTeacherdataConsolidated$tch_govt4+
  basicTeacherdataConsolidated$tch_govt5+
  basicTeacherdataConsolidated$tch_govt6+
  basicTeacherdataConsolidated$tch_govt7+
  basicTeacherdataConsolidated$tch_govt9

basicTeacherdataConsolidated$tch_govt1 <- NULL
basicTeacherdataConsolidated$tch_govt2 <- NULL
basicTeacherdataConsolidated$tch_govt3 <- NULL
basicTeacherdataConsolidated$tch_govt4 <- NULL
basicTeacherdataConsolidated$tch_govt5 <- NULL
basicTeacherdataConsolidated$tch_govt6 <- NULL
basicTeacherdataConsolidated$tch_govt7 <- NULL
basicTeacherdataConsolidated$tch_govt9 <- NULL

basicTeacherdataConsolidated$tch_pvt_total <- basicTeacherdataConsolidated$tch_pvt1+
  basicTeacherdataConsolidated$tch_pvt2+
  basicTeacherdataConsolidated$tch_pvt3+
  basicTeacherdataConsolidated$tch_pvt4+
  basicTeacherdataConsolidated$tch_pvt5+
  basicTeacherdataConsolidated$tch_pvt6+
  basicTeacherdataConsolidated$tch_pvt7+
  basicTeacherdataConsolidated$tch_pvt9

basicTeacherdataConsolidated$tch_pvt1 <- NULL
basicTeacherdataConsolidated$tch_pvt2 <- NULL
basicTeacherdataConsolidated$tch_pvt3 <- NULL
basicTeacherdataConsolidated$tch_pvt4 <- NULL
basicTeacherdataConsolidated$tch_pvt5 <- NULL
basicTeacherdataConsolidated$tch_pvt6 <- NULL
basicTeacherdataConsolidated$tch_pvt7 <- NULL
basicTeacherdataConsolidated$tch_pvt9 <- NULL


basicTeacherdataConsolidated$tch_un_total <- basicTeacherdataConsolidated$tch_un1+
  basicTeacherdataConsolidated$tch_un2+
  basicTeacherdataConsolidated$tch_un3+
  basicTeacherdataConsolidated$tch_un4+
  basicTeacherdataConsolidated$tch_un5+
  basicTeacherdataConsolidated$tch_un6+
  basicTeacherdataConsolidated$tch_un7+
  basicTeacherdataConsolidated$tch_un9

basicTeacherdataConsolidated$tch_un1 <- NULL
basicTeacherdataConsolidated$tch_un2 <- NULL
basicTeacherdataConsolidated$tch_un3 <- NULL
basicTeacherdataConsolidated$tch_un4 <- NULL
basicTeacherdataConsolidated$tch_un5 <- NULL
basicTeacherdataConsolidated$tch_un6 <- NULL
basicTeacherdataConsolidated$tch_un7 <- NULL
basicTeacherdataConsolidated$tch_un9 <- NULL

basicTeacherdataConsolidated$tch_bs_total <- basicTeacherdataConsolidated$tch_bs1+
  basicTeacherdataConsolidated$tch_bs2+
  basicTeacherdataConsolidated$tch_bs3+
  basicTeacherdataConsolidated$tch_bs4+
  basicTeacherdataConsolidated$tch_bs5+
  basicTeacherdataConsolidated$tch_bs6+
  basicTeacherdataConsolidated$tch_bs7

basicTeacherdataConsolidated$tch_bs1 <- NULL
basicTeacherdataConsolidated$tch_bs2 <- NULL
basicTeacherdataConsolidated$tch_bs3 <- NULL
basicTeacherdataConsolidated$tch_bs4 <- NULL
basicTeacherdataConsolidated$tch_bs5 <- NULL
basicTeacherdataConsolidated$tch_bs6 <- NULL
basicTeacherdataConsolidated$tch_bs7 <- NULL



basicTeacherdataConsolidated$tch_s_total <- basicTeacherdataConsolidated$tch_s1+
  basicTeacherdataConsolidated$tch_s2+
  basicTeacherdataConsolidated$tch_s3+
  basicTeacherdataConsolidated$tch_s4+
  basicTeacherdataConsolidated$tch_s5+
  basicTeacherdataConsolidated$tch_s6+
  basicTeacherdataConsolidated$tch_s7

basicTeacherdataConsolidated$tch_s1 <- NULL
basicTeacherdataConsolidated$tch_s2 <- NULL
basicTeacherdataConsolidated$tch_s3 <- NULL
basicTeacherdataConsolidated$tch_s4 <- NULL
basicTeacherdataConsolidated$tch_s5 <- NULL
basicTeacherdataConsolidated$tch_s6 <- NULL
basicTeacherdataConsolidated$tch_s7 <- NULL

basicTeacherdataConsolidated$tch_hs_total <- basicTeacherdataConsolidated$tch_hs1+
  basicTeacherdataConsolidated$tch_hs2+
  basicTeacherdataConsolidated$tch_hs3+
  basicTeacherdataConsolidated$tch_hs4+
  basicTeacherdataConsolidated$tch_hs5+
  basicTeacherdataConsolidated$tch_hs6+
  basicTeacherdataConsolidated$tch_hs7

basicTeacherdataConsolidated$tch_hs1 <- NULL
basicTeacherdataConsolidated$tch_hs2 <- NULL
basicTeacherdataConsolidated$tch_hs3 <- NULL
basicTeacherdataConsolidated$tch_hs4 <- NULL
basicTeacherdataConsolidated$tch_hs5 <- NULL
basicTeacherdataConsolidated$tch_hs6 <- NULL
basicTeacherdataConsolidated$tch_hs7 <- NULL

basicTeacherdataConsolidated$tch_grad_total <- basicTeacherdataConsolidated$tch_grad1+
  basicTeacherdataConsolidated$tch_grad2+
  basicTeacherdataConsolidated$tch_grad3+
  basicTeacherdataConsolidated$tch_grad4+
  basicTeacherdataConsolidated$tch_grad5+
  basicTeacherdataConsolidated$tch_grad6+
  basicTeacherdataConsolidated$tch_grad7

basicTeacherdataConsolidated$tch_grad1 <- NULL
basicTeacherdataConsolidated$tch_grad2 <- NULL
basicTeacherdataConsolidated$tch_grad3 <- NULL
basicTeacherdataConsolidated$tch_grad4 <- NULL
basicTeacherdataConsolidated$tch_grad5 <- NULL
basicTeacherdataConsolidated$tch_grad6 <- NULL
basicTeacherdataConsolidated$tch_grad7 <- NULL


basicTeacherdataConsolidated$tch_pgrad_total <- basicTeacherdataConsolidated$tch_pgrad1+
  basicTeacherdataConsolidated$tch_pgrad2+
  basicTeacherdataConsolidated$tch_pgrad3+
  basicTeacherdataConsolidated$tch_pgrad4+
  basicTeacherdataConsolidated$tch_pgrad5+
  basicTeacherdataConsolidated$tch_pgrad6+
  basicTeacherdataConsolidated$tch_pgrad7

basicTeacherdataConsolidated$tch_pgrad1 <- NULL
basicTeacherdataConsolidated$tch_pgrad2 <- NULL
basicTeacherdataConsolidated$tch_pgrad3 <- NULL
basicTeacherdataConsolidated$tch_pgrad4 <- NULL
basicTeacherdataConsolidated$tch_pgrad5 <- NULL
basicTeacherdataConsolidated$tch_pgrad6 <- NULL
basicTeacherdataConsolidated$tch_pgrad7 <- NULL


basicTeacherdataConsolidated$tch_mph_total <- basicTeacherdataConsolidated$tch_mph1+
  basicTeacherdataConsolidated$tch_mph2+
  basicTeacherdataConsolidated$tch_mph3+
  basicTeacherdataConsolidated$tch_mph4+
  basicTeacherdataConsolidated$tch_mph5+
  basicTeacherdataConsolidated$tch_mph6+
  basicTeacherdataConsolidated$tch_mph7

basicTeacherdataConsolidated$tch_mph1 <- NULL
basicTeacherdataConsolidated$tch_mph2 <- NULL
basicTeacherdataConsolidated$tch_mph3 <- NULL
basicTeacherdataConsolidated$tch_mph4 <- NULL
basicTeacherdataConsolidated$tch_mph5 <- NULL
basicTeacherdataConsolidated$tch_mph6 <- NULL
basicTeacherdataConsolidated$tch_mph7 <- NULL

basicTeacherdataConsolidated$tch_pd_total <- basicTeacherdataConsolidated$tch_pd1+
  basicTeacherdataConsolidated$tch_pd2+
  basicTeacherdataConsolidated$tch_pd3+
  basicTeacherdataConsolidated$tch_pd4+
  basicTeacherdataConsolidated$tch_pd5+
  basicTeacherdataConsolidated$tch_pd6+
  basicTeacherdataConsolidated$tch_pd7

basicTeacherdataConsolidated$tch_pd1 <- NULL
basicTeacherdataConsolidated$tch_pd2 <- NULL
basicTeacherdataConsolidated$tch_pd3 <- NULL
basicTeacherdataConsolidated$tch_pd4 <- NULL
basicTeacherdataConsolidated$tch_pd5 <- NULL
basicTeacherdataConsolidated$tch_pd6 <- NULL
basicTeacherdataConsolidated$tch_pd7 <- NULL



basicTeacherdataConsolidated$tch_m_total <- basicTeacherdataConsolidated$tch_m1+
  basicTeacherdataConsolidated$tch_m2+
  basicTeacherdataConsolidated$tch_m3+
  basicTeacherdataConsolidated$tch_m4+
  basicTeacherdataConsolidated$tch_m5+
  basicTeacherdataConsolidated$tch_m6+
  basicTeacherdataConsolidated$tch_m7

basicTeacherdataConsolidated$tch_m1 <- NULL
basicTeacherdataConsolidated$tch_m2 <- NULL
basicTeacherdataConsolidated$tch_m3 <- NULL
basicTeacherdataConsolidated$tch_m4 <- NULL
basicTeacherdataConsolidated$tch_m5 <- NULL
basicTeacherdataConsolidated$tch_m6 <- NULL
basicTeacherdataConsolidated$tch_m7 <- NULL

basicTeacherdataConsolidated$tch_f_total <- basicTeacherdataConsolidated$tch_f1+
  basicTeacherdataConsolidated$tch_f2+
  basicTeacherdataConsolidated$tch_f3+
  basicTeacherdataConsolidated$tch_f4+
  basicTeacherdataConsolidated$tch_f5+
  basicTeacherdataConsolidated$tch_f6+
  basicTeacherdataConsolidated$tch_f7

basicTeacherdataConsolidated$tch_f1 <- NULL
basicTeacherdataConsolidated$tch_f2 <- NULL
basicTeacherdataConsolidated$tch_f3 <- NULL
basicTeacherdataConsolidated$tch_f4 <- NULL
basicTeacherdataConsolidated$tch_f5 <- NULL
basicTeacherdataConsolidated$tch_f6 <- NULL
basicTeacherdataConsolidated$tch_f7 <- NULL

basicTeacherdataConsolidated$tch_nr_total <- basicTeacherdataConsolidated$tch_nr1+
  basicTeacherdataConsolidated$tch_nr2+
  basicTeacherdataConsolidated$tch_nr3+
  basicTeacherdataConsolidated$tch_nr4+
  basicTeacherdataConsolidated$tch_nr5+
  basicTeacherdataConsolidated$tch_nr6+
  basicTeacherdataConsolidated$tch_nr7

basicTeacherdataConsolidated$tch_nr1 <- NULL
basicTeacherdataConsolidated$tch_nr2 <- NULL
basicTeacherdataConsolidated$tch_nr3 <- NULL
basicTeacherdataConsolidated$tch_nr4 <- NULL
basicTeacherdataConsolidated$tch_nr5 <- NULL
basicTeacherdataConsolidated$tch_nr6 <- NULL
basicTeacherdataConsolidated$tch_nr7 <- NULL


basicTeacherdataConsolidated$tch_m_p_total <- basicTeacherdataConsolidated$tch_m_p1+
  basicTeacherdataConsolidated$tch_m_p2+
  basicTeacherdataConsolidated$tch_m_p3+
  basicTeacherdataConsolidated$tch_m_p4+
  basicTeacherdataConsolidated$tch_m_p5+
  basicTeacherdataConsolidated$tch_m_p6+
  basicTeacherdataConsolidated$tch_m_p7

basicTeacherdataConsolidated$tch_m_p1 <- NULL
basicTeacherdataConsolidated$tch_m_p2 <- NULL
basicTeacherdataConsolidated$tch_m_p3 <- NULL
basicTeacherdataConsolidated$tch_m_p4 <- NULL
basicTeacherdataConsolidated$tch_m_p5 <- NULL
basicTeacherdataConsolidated$tch_m_p6 <- NULL
basicTeacherdataConsolidated$tch_m_p7 <- NULL

basicTeacherdataConsolidated$tch_f_p_total <- basicTeacherdataConsolidated$tch_f_p1+
  basicTeacherdataConsolidated$tch_f_p2+
  basicTeacherdataConsolidated$tch_f_p3+
  basicTeacherdataConsolidated$tch_f_p4+
  basicTeacherdataConsolidated$tch_f_p5+
  basicTeacherdataConsolidated$tch_f_p6+
  basicTeacherdataConsolidated$tch_f_p7

basicTeacherdataConsolidated$tch_f_p1 <- NULL
basicTeacherdataConsolidated$tch_f_p2 <- NULL
basicTeacherdataConsolidated$tch_f_p3 <- NULL
basicTeacherdataConsolidated$tch_f_p4 <- NULL
basicTeacherdataConsolidated$tch_f_p5 <- NULL
basicTeacherdataConsolidated$tch_f_p6 <- NULL
basicTeacherdataConsolidated$tch_f_p7 <- NULL

basicTeacherdataConsolidated$tch_nr_p1 <- NULL
basicTeacherdataConsolidated$tch_nr_p2 <- NULL
basicTeacherdataConsolidated$tch_nr_p3 <- NULL
basicTeacherdataConsolidated$tch_nr_p4 <- NULL
basicTeacherdataConsolidated$tch_nr_p5 <- NULL
basicTeacherdataConsolidated$tch_nr_p6 <- NULL
basicTeacherdataConsolidated$tch_nr_p7 <- NULL

basicTeacherdataConsolidated$tch_eduqual_nr1 <- NULL
basicTeacherdataConsolidated$tch_eduqual_nr2 <- NULL
basicTeacherdataConsolidated$tch_eduqual_nr3 <- NULL
basicTeacherdataConsolidated$tch_eduqual_nr4 <- NULL
basicTeacherdataConsolidated$tch_eduqual_nr5 <- NULL
basicTeacherdataConsolidated$tch_eduqual_nr6 <- NULL
basicTeacherdataConsolidated$tch_eduqual_nr7 <- NULL
basicTeacherdataConsolidated$tch_eduqual_nr_p <- NULL



basicTeacherdataConsolidated$tch_sc_m_total <- basicTeacherdataConsolidated$tch_sc_m1+
  basicTeacherdataConsolidated$tch_sc_m2+
  basicTeacherdataConsolidated$tch_sc_m3+
  basicTeacherdataConsolidated$tch_sc_m4+
  basicTeacherdataConsolidated$tch_sc_m5+
  basicTeacherdataConsolidated$tch_sc_m6+
  basicTeacherdataConsolidated$tch_sc_m7

basicTeacherdataConsolidated$tch_sc_m1 <- NULL
basicTeacherdataConsolidated$tch_sc_m2 <- NULL
basicTeacherdataConsolidated$tch_sc_m3 <- NULL
basicTeacherdataConsolidated$tch_sc_m4 <- NULL
basicTeacherdataConsolidated$tch_sc_m5 <- NULL
basicTeacherdataConsolidated$tch_sc_m6 <- NULL
basicTeacherdataConsolidated$tch_sc_m7 <- NULL


basicTeacherdataConsolidated$tch_sc_f_total <- basicTeacherdataConsolidated$tch_sc_f1+
  basicTeacherdataConsolidated$tch_sc_f2+
  basicTeacherdataConsolidated$tch_sc_f3+
  basicTeacherdataConsolidated$tch_sc_f4+
  basicTeacherdataConsolidated$tch_sc_f5+
  basicTeacherdataConsolidated$tch_sc_f6+
  basicTeacherdataConsolidated$tch_sc_f7

basicTeacherdataConsolidated$tch_sc_f1 <- NULL
basicTeacherdataConsolidated$tch_sc_f2 <- NULL
basicTeacherdataConsolidated$tch_sc_f3 <- NULL
basicTeacherdataConsolidated$tch_sc_f4 <- NULL
basicTeacherdataConsolidated$tch_sc_f5 <- NULL
basicTeacherdataConsolidated$tch_sc_f6 <- NULL
basicTeacherdataConsolidated$tch_sc_f7 <- NULL


basicTeacherdataConsolidated$tch_st_m_total <- basicTeacherdataConsolidated$tch_st_m1+
  basicTeacherdataConsolidated$tch_st_m2+
  basicTeacherdataConsolidated$tch_st_m3+
  basicTeacherdataConsolidated$tch_st_m4+
  basicTeacherdataConsolidated$tch_st_m5+
  basicTeacherdataConsolidated$tch_st_m6+
  basicTeacherdataConsolidated$tch_st_m7

basicTeacherdataConsolidated$tch_st_m1 <- NULL
basicTeacherdataConsolidated$tch_st_m2 <- NULL
basicTeacherdataConsolidated$tch_st_m3 <- NULL
basicTeacherdataConsolidated$tch_st_m4 <- NULL
basicTeacherdataConsolidated$tch_st_m5 <- NULL
basicTeacherdataConsolidated$tch_st_m6 <- NULL
basicTeacherdataConsolidated$tch_st_m7 <- NULL


basicTeacherdataConsolidated$tch_st_f_total <- basicTeacherdataConsolidated$tch_st_f1+
  basicTeacherdataConsolidated$tch_st_f2+
  basicTeacherdataConsolidated$tch_st_f3+
  basicTeacherdataConsolidated$tch_st_f4+
  basicTeacherdataConsolidated$tch_st_f5+
  basicTeacherdataConsolidated$tch_st_f6+
  basicTeacherdataConsolidated$tch_st_f7

basicTeacherdataConsolidated$tch_st_f1 <- NULL
basicTeacherdataConsolidated$tch_st_f2 <- NULL
basicTeacherdataConsolidated$tch_st_f3 <- NULL
basicTeacherdataConsolidated$tch_st_f4 <- NULL
basicTeacherdataConsolidated$tch_st_f5 <- NULL
basicTeacherdataConsolidated$tch_st_f6 <- NULL
basicTeacherdataConsolidated$tch_st_f7 <- NULL


basicTeacherdataConsolidated$tch_pd_p <- NULL

basicTeacherdataConsolidated$trn_tch_m_total <- basicTeacherdataConsolidated$trn_tch_m1+
  basicTeacherdataConsolidated$trn_tch_m2+
  basicTeacherdataConsolidated$trn_tch_m3+
  basicTeacherdataConsolidated$trn_tch_m4+
  basicTeacherdataConsolidated$trn_tch_m5+
  basicTeacherdataConsolidated$trn_tch_m6+
  basicTeacherdataConsolidated$trn_tch_m7

basicTeacherdataConsolidated$trn_tch_m1 <- NULL
basicTeacherdataConsolidated$trn_tch_m2 <- NULL
basicTeacherdataConsolidated$trn_tch_m3 <- NULL
basicTeacherdataConsolidated$trn_tch_m4 <- NULL
basicTeacherdataConsolidated$trn_tch_m5 <- NULL
basicTeacherdataConsolidated$trn_tch_m6 <- NULL
basicTeacherdataConsolidated$trn_tch_m7 <- NULL


basicTeacherdataConsolidated$trn_tch_f_total <- basicTeacherdataConsolidated$trn_tch_f1+
  basicTeacherdataConsolidated$trn_tch_f2+
  basicTeacherdataConsolidated$trn_tch_f3+
  basicTeacherdataConsolidated$trn_tch_f4+
  basicTeacherdataConsolidated$trn_tch_f5+
  basicTeacherdataConsolidated$trn_tch_f6+
  basicTeacherdataConsolidated$trn_tch_f7

basicTeacherdataConsolidated$trn_tch_f1 <- NULL
basicTeacherdataConsolidated$trn_tch_f2 <- NULL
basicTeacherdataConsolidated$trn_tch_f3 <- NULL
basicTeacherdataConsolidated$trn_tch_f4 <- NULL
basicTeacherdataConsolidated$trn_tch_f5 <- NULL
basicTeacherdataConsolidated$trn_tch_f6 <- NULL
basicTeacherdataConsolidated$trn_tch_f7 <- NULL


## Basic Enrollment Data cleaning
basicEnrollmentDataConsolidated[,6:166] = factorsNumeric(basicEnrollmentDataConsolidated[,6:166])
basicEnrollmentDataConsolidated$Enr_Govt_total <- basicEnrollmentDataConsolidated$`Enr Govt1`+
  basicEnrollmentDataConsolidated$`Enr Govt2`+
  basicEnrollmentDataConsolidated$`Enr Govt3`+
  basicEnrollmentDataConsolidated$`Enr Govt4`+
  basicEnrollmentDataConsolidated$`Enr Govt5`+
  basicEnrollmentDataConsolidated$`Enr Govt6`+
  basicEnrollmentDataConsolidated$`Enr Govt7`

basicEnrollmentDataConsolidated$`Enr Govt1` <- NULL
basicEnrollmentDataConsolidated$`Enr Govt2` <- NULL
basicEnrollmentDataConsolidated$`Enr Govt3` <- NULL
basicEnrollmentDataConsolidated$`Enr Govt4` <- NULL
basicEnrollmentDataConsolidated$`Enr Govt5` <- NULL
basicEnrollmentDataConsolidated$`Enr Govt6` <- NULL
basicEnrollmentDataConsolidated$`Enr Govt7` <- NULL
basicEnrollmentDataConsolidated$`Enr Govt9` <- NULL

basicEnrollmentDataConsolidated$Enr_Pvt_total <- basicEnrollmentDataConsolidated$`Enr Pvt1`+
  basicEnrollmentDataConsolidated$`Enr Pvt2`+
  basicEnrollmentDataConsolidated$`Enr Pvt3`+
  basicEnrollmentDataConsolidated$`Enr Pvt4`+
  basicEnrollmentDataConsolidated$`Enr Pvt5`+
  basicEnrollmentDataConsolidated$`Enr Pvt6`+
  basicEnrollmentDataConsolidated$`Enr Pvt7`

basicEnrollmentDataConsolidated$`Enr Pvt1` <- NULL
basicEnrollmentDataConsolidated$`Enr Pvt2` <- NULL
basicEnrollmentDataConsolidated$`Enr Pvt3` <- NULL
basicEnrollmentDataConsolidated$`Enr Pvt4` <- NULL
basicEnrollmentDataConsolidated$`Enr Pvt5` <- NULL
basicEnrollmentDataConsolidated$`Enr Pvt6` <- NULL
basicEnrollmentDataConsolidated$`Enr Pvt7` <- NULL
basicEnrollmentDataConsolidated$`Enr Pvt9` <- NULL

basicEnrollmentDataConsolidated$Enr_Govt_R_total <- basicEnrollmentDataConsolidated$`Enr R Govt1`+
  basicEnrollmentDataConsolidated$`Enr R Govt2`+
  basicEnrollmentDataConsolidated$`Enr R Govt3`+
  basicEnrollmentDataConsolidated$`Enr R Govt4`+
  basicEnrollmentDataConsolidated$`Enr R Govt5`+
  basicEnrollmentDataConsolidated$`Enr R Govt6`+
  basicEnrollmentDataConsolidated$`Enr R Govt7`

basicEnrollmentDataConsolidated$`Enr R Govt1` <- NULL
basicEnrollmentDataConsolidated$`Enr R Govt2` <- NULL
basicEnrollmentDataConsolidated$`Enr R Govt3` <- NULL
basicEnrollmentDataConsolidated$`Enr R Govt4` <- NULL
basicEnrollmentDataConsolidated$`Enr R Govt5` <- NULL
basicEnrollmentDataConsolidated$`Enr R Govt6` <- NULL
basicEnrollmentDataConsolidated$`Enr R Govt7` <- NULL
basicEnrollmentDataConsolidated$`Enr R Govt9` <- NULL


basicEnrollmentDataConsolidated$Enr_R_Pvt_total <- basicEnrollmentDataConsolidated$`Enr R Pvt1`+
  basicEnrollmentDataConsolidated$`Enr R Pvt2`+
  basicEnrollmentDataConsolidated$`Enr R Pvt3`+
  basicEnrollmentDataConsolidated$`Enr R Pvt4`+
  basicEnrollmentDataConsolidated$`Enr R Pvt5`+
  basicEnrollmentDataConsolidated$`Enr R Pvt6`+
  basicEnrollmentDataConsolidated$`Enr R Pvt7`

basicEnrollmentDataConsolidated$`Enr R Pvt1` <- NULL
basicEnrollmentDataConsolidated$`Enr R Pvt2` <- NULL
basicEnrollmentDataConsolidated$`Enr R Pvt3` <- NULL
basicEnrollmentDataConsolidated$`Enr R Pvt4` <- NULL
basicEnrollmentDataConsolidated$`Enr R Pvt5` <- NULL
basicEnrollmentDataConsolidated$`Enr R Pvt6` <- NULL
basicEnrollmentDataConsolidated$`Enr R Pvt7` <- NULL
basicEnrollmentDataConsolidated$`Enr R Pvt9` <- NULL


basicEnrollmentDataConsolidated$Enr_py4_c1_total <- basicEnrollmentDataConsolidated$`Enr Py4 C1`+
  basicEnrollmentDataConsolidated$`Enr Py4 C2`+
  basicEnrollmentDataConsolidated$`Enr Py4 C3`+
  basicEnrollmentDataConsolidated$`Enr Py4 C4`+
  basicEnrollmentDataConsolidated$`Enr Py4 C5`+
  basicEnrollmentDataConsolidated$`Enr Py4 C6`+
  basicEnrollmentDataConsolidated$`Enr Py4 C7`+
  basicEnrollmentDataConsolidated$`Enr Py4 C8`

basicEnrollmentDataConsolidated$`Enr Py4 C1` <- NULL
basicEnrollmentDataConsolidated$`Enr Py4 C2` <- NULL
basicEnrollmentDataConsolidated$`Enr Py4 C3` <- NULL
basicEnrollmentDataConsolidated$`Enr Py4 C4` <- NULL
basicEnrollmentDataConsolidated$`Enr Py4 C5` <- NULL
basicEnrollmentDataConsolidated$`Enr Py4 C6` <- NULL
basicEnrollmentDataConsolidated$`Enr Py4 C7` <- NULL
basicEnrollmentDataConsolidated$`Enr Py4 C8` <- NULL

basicEnrollmentDataConsolidated$Enr_py3_c1_total <- basicEnrollmentDataConsolidated$`Enr Py3 C1`+
  basicEnrollmentDataConsolidated$`Enr Py3 C2`+
  basicEnrollmentDataConsolidated$`Enr Py3 C3`+
  basicEnrollmentDataConsolidated$`Enr Py3 C4`+
  basicEnrollmentDataConsolidated$`Enr Py3 C5`+
  basicEnrollmentDataConsolidated$`Enr Py3 C6`+
  basicEnrollmentDataConsolidated$`Enr Py3 C7`+
  basicEnrollmentDataConsolidated$`Enr Py3 C8`

basicEnrollmentDataConsolidated$`Enr Py3 C1` <- NULL
basicEnrollmentDataConsolidated$`Enr Py3 C2` <- NULL
basicEnrollmentDataConsolidated$`Enr Py3 C3` <- NULL
basicEnrollmentDataConsolidated$`Enr Py3 C4` <- NULL
basicEnrollmentDataConsolidated$`Enr Py3 C5` <- NULL
basicEnrollmentDataConsolidated$`Enr Py3 C6` <- NULL
basicEnrollmentDataConsolidated$`Enr Py3 C7` <- NULL
basicEnrollmentDataConsolidated$`Enr Py3 C8` <- NULL

basicEnrollmentDataConsolidated$Enr_py2_c1_total <- basicEnrollmentDataConsolidated$`Enr Py2 C1`+
  basicEnrollmentDataConsolidated$`Enr Py2 C2`+
  basicEnrollmentDataConsolidated$`Enr Py2 C3`+
  basicEnrollmentDataConsolidated$`Enr Py2 C4`+
  basicEnrollmentDataConsolidated$`Enr Py2 C5`+
  basicEnrollmentDataConsolidated$`Enr Py2 C6`+
  basicEnrollmentDataConsolidated$`Enr Py2 C7`+
  basicEnrollmentDataConsolidated$`Enr Py2 C8`

basicEnrollmentDataConsolidated$`Enr Py2 C1` <- NULL
basicEnrollmentDataConsolidated$`Enr Py2 C2` <- NULL
basicEnrollmentDataConsolidated$`Enr Py2 C3` <- NULL
basicEnrollmentDataConsolidated$`Enr Py2 C4` <- NULL
basicEnrollmentDataConsolidated$`Enr Py2 C5` <- NULL
basicEnrollmentDataConsolidated$`Enr Py2 C6` <- NULL
basicEnrollmentDataConsolidated$`Enr Py2 C7` <- NULL
basicEnrollmentDataConsolidated$`Enr Py2 C8` <- NULL

basicEnrollmentDataConsolidated$Enr_Py1_c1_total <- basicEnrollmentDataConsolidated$`Enr Py1 C1`+
  basicEnrollmentDataConsolidated$`Enr Py1 C2`+
  basicEnrollmentDataConsolidated$`Enr Py1 C3`+
  basicEnrollmentDataConsolidated$`Enr Py1 C4`+
  basicEnrollmentDataConsolidated$`Enr Py1 C5`+
  basicEnrollmentDataConsolidated$`Enr Py1 C6`+
  basicEnrollmentDataConsolidated$`Enr Py1 C7`+
  basicEnrollmentDataConsolidated$`Enr Py1 C8`

basicEnrollmentDataConsolidated$`Enr Py1 C1` <- NULL
basicEnrollmentDataConsolidated$`Enr Py1 C2` <- NULL
basicEnrollmentDataConsolidated$`Enr Py1 C3` <- NULL
basicEnrollmentDataConsolidated$`Enr Py1 C4` <- NULL
basicEnrollmentDataConsolidated$`Enr Py1 C5` <- NULL
basicEnrollmentDataConsolidated$`Enr Py1 C6` <- NULL
basicEnrollmentDataConsolidated$`Enr Py1 C7` <- NULL
basicEnrollmentDataConsolidated$`Enr Py1 C8` <- NULL


basicEnrollmentDataConsolidated$Enr_Cy_c1_total <- basicEnrollmentDataConsolidated$`Enr Cy C1`+
  basicEnrollmentDataConsolidated$`Enr Cy C2`+
  basicEnrollmentDataConsolidated$`Enr Cy C3`+
  basicEnrollmentDataConsolidated$`Enr Cy C4`+
  basicEnrollmentDataConsolidated$`Enr Cy C5`+
  basicEnrollmentDataConsolidated$`Enr Cy C6`+
  basicEnrollmentDataConsolidated$`Enr Cy C7`+
  basicEnrollmentDataConsolidated$`Enr Cy C8`

basicEnrollmentDataConsolidated$`Enr Cy C1` <- NULL
basicEnrollmentDataConsolidated$`Enr Cy C2` <- NULL
basicEnrollmentDataConsolidated$`Enr Cy C3` <- NULL
basicEnrollmentDataConsolidated$`Enr Cy C4` <- NULL
basicEnrollmentDataConsolidated$`Enr Cy C5` <- NULL
basicEnrollmentDataConsolidated$`Enr Cy C6` <- NULL
basicEnrollmentDataConsolidated$`Enr Cy C7` <- NULL
basicEnrollmentDataConsolidated$`Enr Cy C8` <- NULL

basicEnrollmentDataConsolidated$Enr_G_c_total <- basicEnrollmentDataConsolidated$`Enr G C1`+
  basicEnrollmentDataConsolidated$`Enr G C2`+
  basicEnrollmentDataConsolidated$`Enr G C3`+
  basicEnrollmentDataConsolidated$`Enr G C4`+
  basicEnrollmentDataConsolidated$`Enr G C5`+
  basicEnrollmentDataConsolidated$`Enr G C6`+
  basicEnrollmentDataConsolidated$`Enr G C7`+
  basicEnrollmentDataConsolidated$`Enr G C8`

basicEnrollmentDataConsolidated$`Enr G C1` <- NULL
basicEnrollmentDataConsolidated$`Enr G C2` <- NULL
basicEnrollmentDataConsolidated$`Enr G C3` <- NULL
basicEnrollmentDataConsolidated$`Enr G C4` <- NULL
basicEnrollmentDataConsolidated$`Enr G C5` <- NULL
basicEnrollmentDataConsolidated$`Enr G C6` <- NULL
basicEnrollmentDataConsolidated$`Enr G C7` <- NULL
basicEnrollmentDataConsolidated$`Enr G C8` <- NULL


basicEnrollmentDataConsolidated$Enr_DIS_B_total <- basicEnrollmentDataConsolidated$`Enr Dis B C1`+
  basicEnrollmentDataConsolidated$`Enr Dis B C2`+
  basicEnrollmentDataConsolidated$`Enr Dis B C3`+
  basicEnrollmentDataConsolidated$`Enr Dis B C4`+
  basicEnrollmentDataConsolidated$`Enr Dis B C5`+
  basicEnrollmentDataConsolidated$`Enr Dis B C6`+
  basicEnrollmentDataConsolidated$`Enr Dis B C7`+
  basicEnrollmentDataConsolidated$`Enr Dis B C8`

basicEnrollmentDataConsolidated$`Enr Dis B C1` <- NULL
basicEnrollmentDataConsolidated$`Enr Dis B C2` <- NULL
basicEnrollmentDataConsolidated$`Enr Dis B C3` <- NULL
basicEnrollmentDataConsolidated$`Enr Dis B C4` <- NULL
basicEnrollmentDataConsolidated$`Enr Dis B C5` <- NULL
basicEnrollmentDataConsolidated$`Enr Dis B C6` <- NULL
basicEnrollmentDataConsolidated$`Enr Dis B C7` <- NULL
basicEnrollmentDataConsolidated$`Enr Dis B C8` <- NULL

basicEnrollmentDataConsolidated$Enr_DIS_G_total <- basicEnrollmentDataConsolidated$`Enr Dis G C1`+
  basicEnrollmentDataConsolidated$`Enr Dis G C2`+
  basicEnrollmentDataConsolidated$`Enr Dis G C3`+
  basicEnrollmentDataConsolidated$`Enr Dis G C4`+
  basicEnrollmentDataConsolidated$`Enr Dis G C5`+
  basicEnrollmentDataConsolidated$`Enr Dis G C6`+
  basicEnrollmentDataConsolidated$`Enr Dis G C7`+
  basicEnrollmentDataConsolidated$`Enr Dis G C8`

basicEnrollmentDataConsolidated$`Enr Dis G C1` <- NULL
basicEnrollmentDataConsolidated$`Enr Dis G C2` <- NULL
basicEnrollmentDataConsolidated$`Enr Dis G C3` <- NULL
basicEnrollmentDataConsolidated$`Enr Dis G C4` <- NULL
basicEnrollmentDataConsolidated$`Enr Dis G C5` <- NULL
basicEnrollmentDataConsolidated$`Enr Dis G C6` <- NULL
basicEnrollmentDataConsolidated$`Enr Dis G C7` <- NULL
basicEnrollmentDataConsolidated$`Enr Dis G C8` <- NULL

basicEnrollmentDataConsolidated$Enr_Med1_total <- basicEnrollmentDataConsolidated$`Enr Med1 1`+
  basicEnrollmentDataConsolidated$`Enr Med1 2`+
  basicEnrollmentDataConsolidated$`Enr Med1 3`+
  basicEnrollmentDataConsolidated$`Enr Med1 4`+
  basicEnrollmentDataConsolidated$`Enr Med1 5`+
  basicEnrollmentDataConsolidated$`Enr Med1 6`+
  basicEnrollmentDataConsolidated$`Enr Med1 7`

basicEnrollmentDataConsolidated$`Enr Med1 1` <- NULL
basicEnrollmentDataConsolidated$`Enr Med1 2` <- NULL
basicEnrollmentDataConsolidated$`Enr Med1 3` <- NULL
basicEnrollmentDataConsolidated$`Enr Med1 4` <- NULL
basicEnrollmentDataConsolidated$`Enr Med1 5` <- NULL
basicEnrollmentDataConsolidated$`Enr Med1 6` <- NULL
basicEnrollmentDataConsolidated$`Enr Med1 7` <- NULL

basicEnrollmentDataConsolidated$Enr_Med2_total <- basicEnrollmentDataConsolidated$`Enr Med2 1`+
  basicEnrollmentDataConsolidated$`Enr Med2 2`+
  basicEnrollmentDataConsolidated$`Enr Med2 3`+
  basicEnrollmentDataConsolidated$`Enr Med2 4`+
  basicEnrollmentDataConsolidated$`Enr Med2 5`+
  basicEnrollmentDataConsolidated$`Enr Med2 6`+
  basicEnrollmentDataConsolidated$`Enr Med2 7`

basicEnrollmentDataConsolidated$`Enr Med2 1` <- NULL
basicEnrollmentDataConsolidated$`Enr Med2 2` <- NULL
basicEnrollmentDataConsolidated$`Enr Med2 3` <- NULL
basicEnrollmentDataConsolidated$`Enr Med2 4` <- NULL
basicEnrollmentDataConsolidated$`Enr Med2 5` <- NULL
basicEnrollmentDataConsolidated$`Enr Med2 6` <- NULL
basicEnrollmentDataConsolidated$`Enr Med2 7` <- NULL

basicEnrollmentDataConsolidated$Enr_Med3_total <- basicEnrollmentDataConsolidated$`Enr Med3 1`+
  basicEnrollmentDataConsolidated$`Enr Med3 2`+
  basicEnrollmentDataConsolidated$`Enr Med3 3`+
  basicEnrollmentDataConsolidated$`Enr Med3 4`+
  basicEnrollmentDataConsolidated$`Enr Med3 5`+
  basicEnrollmentDataConsolidated$`Enr Med3 6`+
  basicEnrollmentDataConsolidated$`Enr Med3 7`

basicEnrollmentDataConsolidated$`Enr Med3 1` <- NULL
basicEnrollmentDataConsolidated$`Enr Med3 2` <- NULL
basicEnrollmentDataConsolidated$`Enr Med3 3` <- NULL
basicEnrollmentDataConsolidated$`Enr Med3 4` <- NULL
basicEnrollmentDataConsolidated$`Enr Med3 5` <- NULL
basicEnrollmentDataConsolidated$`Enr Med3 6` <- NULL
basicEnrollmentDataConsolidated$`Enr Med3 7` <- NULL

basicEnrollmentDataConsolidated$`Gerup Py1` <- NULL
basicEnrollmentDataConsolidated$`Gerup Py2` <- NULL

basicEnrollmentDataConsolidated$`Nerup Py1` <- NULL
basicEnrollmentDataConsolidated$`Nerup Py2` <- NULL

basicEnrollmentDataConsolidated$`Gerp Py1` <- NULL
basicEnrollmentDataConsolidated$`Gerp Py2` <- NULL

basicEnrollmentDataConsolidated$`Nerp Py1` <- NULL
basicEnrollmentDataConsolidated$`Nerp Py2` <- NULL

basicEnrollmentDataConsolidated$Rep_C_total <- basicEnrollmentDataConsolidated$`Rep C1`+
  basicEnrollmentDataConsolidated$`Rep C2`+
  basicEnrollmentDataConsolidated$`Rep C3`+
  basicEnrollmentDataConsolidated$`Rep C4`+
  basicEnrollmentDataConsolidated$`Rep C5`+
  basicEnrollmentDataConsolidated$`Rep C6`+
  basicEnrollmentDataConsolidated$`Rep C7`+
  basicEnrollmentDataConsolidated$`Rep C8`

basicEnrollmentDataConsolidated$`Rep C1` <- NULL
basicEnrollmentDataConsolidated$`Rep C2` <- NULL
basicEnrollmentDataConsolidated$`Rep C3` <- NULL
basicEnrollmentDataConsolidated$`Rep C4` <- NULL
basicEnrollmentDataConsolidated$`Rep C5` <- NULL
basicEnrollmentDataConsolidated$`Rep C6` <- NULL
basicEnrollmentDataConsolidated$`Rep C7` <- NULL
basicEnrollmentDataConsolidated$`Rep C8` <- NULL


alldataconsolidated <- merge(basicDataConsolidated,basicSchoolDataConsolidated,by.x=c('distcd','year','distname','statename','statecd'),by.y=c('distcd','year','distname','statename','statecd'))

alldataconsolidated[,6:57] <- factorsNumeric(alldataconsolidated[,6:57])

write.csv(alldataconsolidated,file = "mergeddata1.csv")


# replaces na with '0'
alldataconsolidated[is.na(alldataconsolidated)] <- 0
data1 <- cor(alldataconsolidated[,6:57])
basicEnrollmentDataConsolidated$statecd <- basicEnrollmentDataConsolidated$Statecd
basicEnrollmentDataConsolidated$statename <- basicEnrollmentDataConsolidated$`State Name `
alldataconsolidated_2 <- merge(basicEnrollmentDataConsolidated,basicTeacherdataConsolidated,
                               by.x = c('Year','statename','distname'),
                               by.y = c('Year','statename','distname'))



alldataconsolidated_2[,7:84] <- factorsNumeric(alldataconsolidated_2[,7:84])

#Unnecessary data
alldataconsolidated_2$`Gerp Cy` <- NULL
alldataconsolidated_2$`Gerup Cy` <- NULL
alldataconsolidated_2$`Nerp Cy` <- NULL
alldataconsolidated_2$`Nerup Cy` <- NULL
data <- cor(alldataconsolidated_2[,7:80])

##due to multi collinearity we are removing some fields
alldataconsolidated_2$`Sc Enrup Cy` <- NULL
alldataconsolidated_2$`Scg Enrp Cy` <- NULL
alldataconsolidated_2$`Scg Enrup Cy` <- NULL
data <- cor(alldataconsolidated_2[,7:77])
alldataconsolidated_2$`Grossness Up` <- NULL
alldataconsolidated_2$`Pc Girls` <- NULL
data <- cor(alldataconsolidated_2[,7:75])

alldataConsolidated_final <- merge(alldataconsolidated,alldataconsolidated_2,
                                   by.x = c('year','statename','distname')
                                   ,by.y = c('Year','statename','distname'))

alldataConsolidated_final$statecd.x <- NULL
alldataConsolidated_final$statecd.y <- NULL
alldataConsolidated_final$distcd.x <- NULL
alldataConsolidated_final$distcd.y <- NULL
alldataConsolidated_final$`State Name ` <- NULL
alldataConsolidated_final[,6:124] <- factorsNumeric(alldataConsolidated_final[,6:124])

alldataConsolidated_final$sdg_total <- alldataConsolidated_final$`sdg 1`+
  alldataConsolidated_final$`sdg 2`+
  alldataConsolidated_final$`sdg 3`+
  alldataConsolidated_final$`sdg 4`+
  alldataConsolidated_final$`sdg 5`+
  alldataConsolidated_final$`sdg 6`+
  alldataConsolidated_final$`sdg 7`

alldataConsolidated_final$`sdg 1` <- NULL
alldataConsolidated_final$`sdg 2`<- NULL
alldataConsolidated_final$`sdg 3`<- NULL
alldataConsolidated_final$`sdg 4`<- NULL
alldataConsolidated_final$`sdg 5`<- NULL
alldataConsolidated_final$`sdg 6`<- NULL
alldataConsolidated_final$`sdg 7`<- NULL

alldataConsolidated_final$tlm_total <- alldataConsolidated_final$`tlm 1`+
  alldataConsolidated_final$`tlm 2`+
  alldataConsolidated_final$`tlm 3`+
  alldataConsolidated_final$`tlm 4`+
  alldataConsolidated_final$`tlm 5`+
  alldataConsolidated_final$`tlm 6`+
  alldataConsolidated_final$`tlm 7`

alldataConsolidated_final$`tlm 1` <- NULL
alldataConsolidated_final$`tlm 2`<- NULL
alldataConsolidated_final$`tlm 3`<- NULL
alldataConsolidated_final$`tlm 4`<- NULL
alldataConsolidated_final$`tlm 5`<- NULL
alldataConsolidated_final$`tlm 6`<- NULL
alldataConsolidated_final$`tlm 7`<- NULL
alldataConsolidated_final$Statecd <- NULL

colSums(is.na(alldataConsolidated_final))
# no NAs are present

write.csv(alldataConsolidated_final,file = "final_data.csv")
