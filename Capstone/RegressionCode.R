library(dplyr)
library(caTools)
library(lmtest)
library(sandwich)
setwd("C:\\Users\\neoistheone\\Documents\\Capstone\\DISE")
finaldata <- read.csv("final_data.csv")
summary(finaldata)

## Including Plots

#sYou can also embed plots, for example:
  
plot(density(finaldata$overall_lit)) # left scewed
plot(density(finaldata$female_lit)) # left scewed
plot(density(finaldata$p_urb_pop)) #  right scewed
plot(density(finaldata$totschools)) # right scewed
plot(density(finaldata$schgovt_total)) # right scewed
plot(density(finaldata$schpvt_total)) # Normal
plot(density(finaldata$clusters)) # right scewed
plot(density(finaldata$sch_r_govt_total)) # right scewed
plot(density(finaldata$sch_r_pvt_total)) # Normal
plot(density(finaldata$cls1.school)) # right scewed
plot(density(finaldata$tch1.school)) # right scewed
plot(density(finaldata$gtoilet.sch)) # left scewed
plot(density(finaldata$water.sch)) # right scewed
plot(density(finaldata$enr.stch.sch)) # right scewed
plot(density(finaldata$no.fem.sch)) # right scewed
plot(density(finaldata$sch.50enr)) # right scewed
plot(density(finaldata$tot.cls)) # right scewed
plot(density(finaldata$kitshed_total)) # Normal
plot(density(finaldata$cls.good)) # right scewed
plot(density(finaldata$cls.major)) # Normal
plot(density(finaldata$cls.minor))
plot(density(finaldata$cls.other))

plot(density(finaldata$sch.since.2003.1_total)) # Normal
plot(density(finaldata$btoilet.sch_total)) 
plot(density(finaldata$electric.sch_total))  # Normal
plot(density(finaldata$computer.sch_total))  # Normal
plot(density(finaldata$mdm_total))  # Normal
plot(density(finaldata$smc_total))  # Normal

plot(density(finaldata$sch_un_total))  # right scewed
plot(density(finaldata$books_total))  # right scewed
plot(density((finaldata$uniform_total))  # right scewed
     
plot(density(finaldata$Enr_Govt_total))# right scewed
plot(density(finaldata$Enr_Pvt_total))# right scewed
plot(density(finaldata$Enr_Govt_R_total))# right scewed
plot(density(finaldata$Enr_R_Pvt_total))# right scewed
plot(density(finaldata$tch_govt_total))
plot(density(finaldata$tch_pvt_total))
     
plot(density(finaldata$Sc.Enrp.Cy))
plot(density(finaldata$St.Enrp.Cy))
     
final_data <- finaldata
     
plot(density(final_data$overall_lit^3)) # left scewed
plot(density(final_data$female_lit^3)) # left scewed
plot(density(log(final_data$totschools))) # right scewed
plot(density(log(final_data$schgovt_total))) # right scewed
plot(density(final_data$schpvt_total)) # Normal
plot(density(log(final_data$clusters))) # right scewed
plot(density(log(final_data$sch_r_govt_total))) # right scewed
plot(density(final_data$sch_r_pvt_total)) # Normal
plot(density(log(final_data$cls1.school))) # right scewed
plot(density(log(final_data$tch1.school))) # right scewed
plot(density(final_data$gtoilet.sch^3)) # right scewed
plot(density(log(finaldata$water.sch))) # right scewed
     
plot(density(log(final_data$enr.stch.sch))) # right scewed
plot(density(log(final_data$no.fem.sch))) # right scewed
plot(density(log(final_data$sch.50enr))) # right scewed
plot(density(log(final_data$tot.cls))) # right scewed
     
plot(density(finaldata$kitshed_total)) # Normal
plot(density(log(finaldata$cls.good))) # right scewed
plot(density(finaldata$cls.major)) # Normal
plot(density(finaldata$cls.minor))# Normal
plot(density(finaldata$cls.other))# Normal
     
plot(density(final_data$sch_un_total))  # right scewed
     

plot(density(log(finaldata$Enr_Govt_total))) 
plot(density(log(finaldata$Enr_Pvt_total))) 
plot(density(log(finaldata$Enr_Govt_R_total))) 
plot(density(log(finaldata$Enr_R_Pvt_total)))  
plot(density(log(finaldata$tch_govt_total)))
plot(density(log(finaldata$tch_pvt_total)))

plot(density(log(finaldata$Sc.Enrp.Cy)))
plot(density(log(finaldata$St.Enrp.Cy)))


model1 <- lm(overall_lit ~ p_urb_pop + sch_r_govt_total+ sch_r_pvt_total + cls1.school+ tch1.school ,final_data)
summary(model1)
# remove the less significant variables
model2 <- lm(overall_lit ~ p_urb_pop +  schpvt_total+sch_r_govt_total+ sch_r_pvt_total + cls1.school+ tch1.school,final_data)
summary(model2)
# Dividing sample to train and test data
sample = sample.split(final_data$overall_lit, SplitRatio = .8)
final_dataTrain = subset(final_data, sample == TRUE)
final_dataTest = subset(final_data, sample == FALSE)


# Applying transormations on the data
#based on above plots
final_dataTrain$overall_lit[is.nan(final_dataTrain$overall_lit)] <- NA
final_dataTrain$overall_lit[is.na(final_dataTrain$overall_lit)] <- 0
final_dataTrain$overall_lit <- final_dataTrain$overall_lit^3

final_dataTrain$schpvt_total[is.nan(final_dataTrain$schpvt_total)] <- NA
final_dataTrain$schpvt_total[is.na(final_dataTrain$schpvt_total)] <- 0


final_dataTrain$p_urb_pop[is.nan(final_dataTrain$p_urb_pop)] <- NA
final_dataTrain$p_urb_pop[is.na(final_dataTrain$p_urb_pop)] <- 0
final_dataTrain$p_urb_pop <- log(final_dataTrain$p_urb_pop)
final_dataTrain$p_urb_pop[is.nan(final_dataTrain$p_urb_pop)] <- NA
final_dataTrain$p_urb_pop[is.na(final_dataTrain$p_urb_pop)] <- 0
final_dataTrain$p_urb_pop[is.infinite(final_dataTrain$p_urb_pop)] <- 0
plot(density(final_dataTrain$p_urb_pop))

final_dataTrain$sch_r_govt_total[is.nan(final_dataTrain$sch_r_govt_total)] <- NA
final_dataTrain$sch_r_govt_total[is.na(final_dataTrain$sch_r_govt_total)] <- 0
final_dataTrain$sch_r_govt_total <- log(final_dataTrain$sch_r_govt_total)

final_dataTrain$cls1.school[is.infinite(final_dataTrain$cls1.school)] <- NA
final_dataTrain$cls1.school[is.nan(final_dataTrain$cls1.school)] <- NA
final_dataTrain$cls1.school[is.na(final_dataTrain$cls1.school)] <- 0
final_dataTrain$cls1.school <- log(final_dataTrain$cls1.school)
final_dataTrain$cls1.school[is.infinite(final_dataTrain$cls1.school)] <- 0

final_dataTrain$tch1.school[is.infinite(final_dataTrain$tch1.school)] <- NA
final_dataTrain$tch1.school[is.nan(final_dataTrain$tch1.school)] <- NA
final_dataTrain$tch1.school[is.na(final_dataTrain$tch1.school)] <- 1
final_dataTrain$tch1.school <- log(final_dataTrain$tch1.school)
final_dataTrain$tch1.school[is.infinite(final_dataTrain$tch1.school)] <- 0

final_dataTrain$gtoilet.sch <- final_dataTrain$gtoilet.sch^3
final_dataTrain$water.sch <- log(final_dataTrain$water.sch)

final_dataTrain$enr.stch.sch <- log(final_dataTrain$enr.stch.sch) # right scewed
final_dataTrain$enr.stch.sch[is.infinite(final_dataTrain$enr.stch.sch)] <- 0

final_dataTrain$no.fem.sch <- log(final_dataTrain$no.fem.sch) # right scewed
final_dataTrain$no.fem.sch[is.infinite(final_dataTrain$no.fem.sch)] <- 0

final_dataTrain$sch.50enr <- log(final_dataTrain$sch.50enr) # right scewed
final_dataTrain$sch.50enr[is.infinite(final_dataTrain$sch.50enr)] <- 0

final_dataTrain$tot.cls <- log(final_dataTrain$tot.cls) # right scewed
final_dataTrain$tot.cls[is.infinite(final_dataTrain$tot.cls)] <- 0


final_dataTrain$books_total <- final_dataTrain$books_total^3 - final_dataTrain$books_total+final_dataTrain$books_total^2
final_dataTrain$uniform_total <- (final_dataTrain$uniform_total-final_dataTrain$uniform_total^2-final_dataTrain$uniform_total^3)^2

final_dataTrain$Enr_Govt_total <- log(final_dataTrain$Enr_Govt_total)
final_dataTrain$Enr_Pvt_total <- log(final_dataTrain$Enr_Pvt_total) 
final_dataTrain$Enr_Pvt_total[is.infinite(final_dataTrain$Enr_Pvt_total)] <- 0

final_dataTrain$Enr_Govt_R_total <-  log(final_dataTrain$Enr_Govt_R_total)
final_dataTrain$Enr_Govt_R_total[is.infinite(final_dataTrain$Enr_Govt_R_total)] <- 0
final_dataTrain$Enr_R_Pvt_total <- log(final_dataTrain$Enr_R_Pvt_total)  
final_dataTrain$Enr_R_Pvt_total[is.infinite(final_dataTrain$Enr_R_Pvt_total)] <- 0


final_dataTrain$tch_govt_total <- log(final_dataTrain$tch_govt_total)
final_dataTrain$tch_govt_total[is.infinite(final_dataTrain$tch_govt_total)] <- 0


final_dataTrain$tch_pvt_total <- log(final_dataTrain$tch_pvt_total)
final_dataTrain$tch_pvt_total[is.infinite(final_dataTrain$tch_pvt_total)] <- 0


final_dataTrain$Sc.Enrp.Cy <- log(final_dataTrain$Sc.Enrp.Cy)
final_dataTrain$Sc.Enrp.Cy[is.infinite(final_dataTrain$Sc.Enrp.Cy)] <- 0


final_dataTrain$St.Enrp.Cy <- log(final_dataTrain$St.Enrp.Cy)
final_dataTrain$St.Enrp.Cy[is.infinite(final_dataTrain$St.Enrp.Cy)] <- 0


model3 <- lm(overall_lit ~   p_urb_pop +sch_r_govt_total+ sch_r_pvt_total + cls1.school + tch1.school + gtoilet.sch+water.sch+ enr.stch.sch+ no.fem.sch+ sch.50enr + cls.major +  electric.sch_total+  sch_un_total + Enr_Govt_total+Enr_Pvt_total + tch_govt_total,final_dataTrain)


###Transformations for test data
final_dataTest$overall_lit[is.nan(final_dataTest$overall_lit)] <- NA
final_dataTest$overall_lit[is.na(final_dataTest$overall_lit)] <- 0
final_dataTest$overall_lit <- final_dataTest$overall_lit^3

final_dataTest$schpvt_total[is.nan(final_dataTest$schpvt_total)] <- NA
final_dataTest$schpvt_total[is.na(final_dataTest$schpvt_total)] <- 0


final_dataTest$p_urb_pop[is.nan(final_dataTest$p_urb_pop)] <- NA
final_dataTest$p_urb_pop[is.na(final_dataTest$p_urb_pop)] <- 0
final_dataTest$p_urb_pop <- log(final_dataTest$p_urb_pop)
final_dataTest$p_urb_pop[is.nan(final_dataTest$p_urb_pop)] <- NA
final_dataTest$p_urb_pop[is.na(final_dataTest$p_urb_pop)] <- 0
final_dataTest$p_urb_pop[is.infinite(final_dataTest$p_urb_pop)] <- 0
plot(density(final_dataTest$p_urb_pop))

final_dataTest$sch_r_govt_total[is.nan(final_dataTest$sch_r_govt_total)] <- NA
final_dataTest$sch_r_govt_total[is.na(final_dataTest$sch_r_govt_total)] <- 0
final_dataTest$sch_r_govt_total <- log(final_dataTest$sch_r_govt_total)

final_dataTest$cls1.school[is.infinite(final_dataTest$cls1.school)] <- NA
final_dataTest$cls1.school[is.nan(final_dataTest$cls1.school)] <- NA
final_dataTest$cls1.school[is.na(final_dataTest$cls1.school)] <- 0
final_dataTest$cls1.school <- log(final_dataTest$cls1.school)
final_dataTest$cls1.school[is.infinite(final_dataTest$cls1.school)] <- 0

final_dataTest$tch1.school[is.infinite(final_dataTest$tch1.school)] <- NA
final_dataTest$tch1.school[is.nan(final_dataTest$tch1.school)] <- NA
final_dataTest$tch1.school[is.na(final_dataTest$tch1.school)] <- 1
final_dataTest$tch1.school <- log(final_dataTest$tch1.school)
final_dataTest$tch1.school[is.infinite(final_dataTest$tch1.school)] <- 0

final_dataTest$gtoilet.sch <- final_dataTest$gtoilet.sch^3
final_dataTest$water.sch <- log(final_dataTest$water.sch)

final_dataTest$enr.stch.sch <- log(final_dataTest$enr.stch.sch) # right scewed
final_dataTest$enr.stch.sch[is.infinite(final_dataTest$enr.stch.sch)] <- 0

final_dataTest$no.fem.sch <- log(final_dataTest$no.fem.sch) # right scewed
final_dataTest$no.fem.sch[is.infinite(final_dataTest$no.fem.sch)] <- 0

final_dataTest$sch.50enr <- log(final_dataTest$sch.50enr) # right scewed
final_dataTest$sch.50enr[is.infinite(final_dataTest$sch.50enr)] <- 0

final_dataTest$tot.cls <- log(final_dataTest$tot.cls) # right scewed
final_dataTest$tot.cls[is.infinite(final_dataTest$tot.cls)] <- 0


final_dataTest$books_total <- final_dataTest$books_total^3 - final_dataTest$books_total+final_dataTest$books_total^2
final_dataTest$uniform_total <- (final_dataTest$uniform_total-final_dataTest$uniform_total^2-final_dataTest$uniform_total^3)^2

final_dataTest$Enr_Govt_total <- log(final_dataTest$Enr_Govt_total)
final_dataTest$Enr_Pvt_total <- log(final_dataTest$Enr_Pvt_total) 
final_dataTest$Enr_Pvt_total[is.infinite(final_dataTest$Enr_Pvt_total)] <- 0

final_dataTest$Enr_Govt_R_total <-  log(final_dataTest$Enr_Govt_R_total)
final_dataTest$Enr_Govt_R_total[is.infinite(final_dataTest$Enr_Govt_R_total)] <- 0
final_dataTest$Enr_R_Pvt_total <- log(final_dataTest$Enr_R_Pvt_total)  
final_dataTest$Enr_R_Pvt_total[is.infinite(final_dataTest$Enr_R_Pvt_total)] <- 0


final_dataTest$tch_govt_total <- log(final_dataTest$tch_govt_total)
final_dataTest$tch_govt_total[is.infinite(final_dataTest$tch_govt_total)] <- 0


final_dataTest$tch_pvt_total <- log(final_dataTest$tch_pvt_total)
final_dataTest$tch_pvt_total[is.infinite(final_dataTest$tch_pvt_total)] <- 0


final_dataTest$Sc.Enrp.Cy <- log(final_dataTest$Sc.Enrp.Cy)
final_dataTest$Sc.Enrp.Cy[is.infinite(final_dataTest$Sc.Enrp.Cy)] <- 0


final_dataTest$St.Enrp.Cy <- log(final_dataTest$St.Enrp.Cy)
final_dataTest$St.Enrp.Cy[is.infinite(final_dataTest$St.Enrp.Cy)] <- 0
summary(model3)

## Generating the predicted RSquared Value to test prediction
y_hat <- predict.lm(model3,newdata = final_dataTest,se.fit = TRUE)$fit
y_hat <- as.vector(y_hat)
dev <- final_dataTest$overall_lit-y_hat
num <- sum(dev^2)
dev1 <- final_dataTest$overall_lit- mean(final_dataTest$overall_lit)
den <- sum(dev1^2)
predicted_rsqr <- 1- (num/den)
predicted_rsqr
