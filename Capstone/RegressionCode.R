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
# Applying transormations on the data
#based on above plots
final_data$overall_lit[is.nan(final_data$overall_lit)] <- NA
final_data$overall_lit[is.na(final_data$overall_lit)] <- 0
final_data$overall_lit <- final_data$overall_lit^3

final_data$schpvt_total[is.nan(final_data$schpvt_total)] <- NA
final_data$schpvt_total[is.na(final_data$schpvt_total)] <- 0


final_data$p_urb_pop[is.nan(final_data$p_urb_pop)] <- NA
final_data$p_urb_pop[is.na(final_data$p_urb_pop)] <- 0
final_data$p_urb_pop <- log(final_data$p_urb_pop)
final_data$p_urb_pop[is.nan(final_data$p_urb_pop)] <- NA
final_data$p_urb_pop[is.na(final_data$p_urb_pop)] <- 0
final_data$p_urb_pop[is.infinite(final_data$p_urb_pop)] <- 0
plot(density(final_data$p_urb_pop))

final_data$sch_r_govt_total[is.nan(final_data$sch_r_govt_total)] <- NA
final_data$sch_r_govt_total[is.na(final_data$sch_r_govt_total)] <- 0
final_data$sch_r_govt_total <- log(final_data$sch_r_govt_total)

final_data$cls1.school[is.infinite(final_data$cls1.school)] <- NA
final_data$cls1.school[is.nan(final_data$cls1.school)] <- NA
final_data$cls1.school[is.na(final_data$cls1.school)] <- 0
final_data$cls1.school <- log(final_data$cls1.school)
final_data$cls1.school[is.infinite(final_data$cls1.school)] <- 0

final_data$tch1.school[is.infinite(final_data$tch1.school)] <- NA
final_data$tch1.school[is.nan(final_data$tch1.school)] <- NA
final_data$tch1.school[is.na(final_data$tch1.school)] <- 1
final_data$tch1.school <- log(final_data$tch1.school)
final_data$tch1.school[is.infinite(final_data$tch1.school)] <- 0

final_data$gtoilet.sch <- final_data$gtoilet.sch^3
final_data$water.sch <- log(final_data$water.sch)

final_data$enr.stch.sch <- log(final_data$enr.stch.sch) # right scewed
final_data$enr.stch.sch[is.infinite(final_data$enr.stch.sch)] <- 0

final_data$no.fem.sch <- log(final_data$no.fem.sch) # right scewed
final_data$no.fem.sch[is.infinite(final_data$no.fem.sch)] <- 0

final_data$sch.50enr <- log(final_data$sch.50enr) # right scewed
final_data$sch.50enr[is.infinite(final_data$sch.50enr)] <- 0

final_data$tot.cls <- log(final_data$tot.cls) # right scewed
final_data$tot.cls[is.infinite(final_data$tot.cls)] <- 0


final_data$books_total <- final_data$books_total^3 - final_data$books_total+final_data$books_total^2
final_data$uniform_total <- (final_data$uniform_total-final_data$uniform_total^2-final_data$uniform_total^3)^2

final_data$Enr_Govt_total <- log(final_data$Enr_Govt_total)
final_data$Enr_Pvt_total <- log(final_data$Enr_Pvt_total) 
final_data$Enr_Pvt_total[is.infinite(final_data$Enr_Pvt_total)] <- 0

final_data$Enr_Govt_R_total <-  log(final_data$Enr_Govt_R_total)
final_data$Enr_Govt_R_total[is.infinite(final_data$Enr_Govt_R_total)] <- 0
final_data$Enr_R_Pvt_total <- log(final_data$Enr_R_Pvt_total)  
final_data$Enr_R_Pvt_total[is.infinite(final_data$Enr_R_Pvt_total)] <- 0


final_data$tch_govt_total <- log(final_data$tch_govt_total)
final_data$tch_govt_total[is.infinite(final_data$tch_govt_total)] <- 0


final_data$tch_pvt_total <- log(final_data$tch_pvt_total)
final_data$tch_pvt_total[is.infinite(final_data$tch_pvt_total)] <- 0


final_data$Sc.Enrp.Cy <- log(final_data$Sc.Enrp.Cy)
final_data$Sc.Enrp.Cy[is.infinite(final_data$Sc.Enrp.Cy)] <- 0


final_data$St.Enrp.Cy <- log(final_data$St.Enrp.Cy)
final_data$St.Enrp.Cy[is.infinite(final_data$St.Enrp.Cy)] <- 0


model3 <- lm(overall_lit ~   p_urb_pop +sch_r_govt_total+ sch_r_pvt_total + cls1.school + tch1.school + gtoilet.sch+water.sch+ enr.stch.sch+ no.fem.sch+ sch.50enr + cls.major +  electric.sch_total+  sch_un_total + Enr_Govt_total+Enr_Pvt_total + tch_govt_total,final_data)


summary(model3)
     