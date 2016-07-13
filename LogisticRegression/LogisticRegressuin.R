#Framingham data
setwd("C:\\Users\\\\Documents\\LogisticReg")
framinghamData <- read.csv("framingham.csv")
str(framinghamData)
cor(framinghamData)
#install packages caTools
library(caTools)
set.seed(1000)
split = sample.split(framinghamData$TenYearCHD,SplitRatio = 0.65)
train = subset(framinghamData,split = TRUE)
test =  subset(framinghamData,split = FALSE)
framinghamLog <- glm(TenYearCHD ~ .,data=train,family = binomial)
summary(framinghamLog)
predictTest <- predict(framinghamLog,type="response",newdata = test)
table(test$TenYearCHD,predictTest>0.5)

#install packages ROCR
library(ROCR)
ROCRPred <- prediction(predictTest,test$TenYearCHD)
as.numeric(performance(ROCRPred,"auc")@y.values)
