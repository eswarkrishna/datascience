setwd("C:\\Users\\Documents\\linear regression")
wineData <- read.csv("wine.csv")
str(wineData)
summary(wineData)
model1 <- lm(Price ~ AGST,data = wineData)
summary(model1)
SSE = sum(model1$residuals^2)
model2 <- lm(Price ~ AGST + HarvestRain,data = wineData)
summary(model2)
SSE2 = sum(model2$residuals^2)
model3 <- lm(Price ~ AGST + HarvestRain + Age + FrancePop + WinterRain ,data = wineData)
summary(model3)
SSE3 <- sum(model3$residuals^2)
summary(SSE3)
cor(wineData)

summary(model3)
model4 <- lm(Price ~ AGST + HarvestRain + Age + WinterRain,data = wineData)
summary(model4)

#model 3 and model 4 are mostly the same
#suddenly age became significant as you see a "**" , this multi collinearity problem
cor(wineData)
model5 <- lm(Price ~ AGST + HarvestRain +  WinterRain,data = wineData)
summary(model5)

# From the correlation data we see FrancePop and Age are multi collinear so we remove them
# Multicollinearity means FrancePop and Age [independent variables] are highly positively/negatively correlated
# so we need to remove such fields and check for the Multi and adjusted R-Squared
# So among the models that we got we feel Model4 is better

# Predict Test
wineTest = read.csv("wine_test.csv")
str(wineTest)
predictTest = predict(model4,newdata = wineTest)
predictTest

SSE = sum((wineTest$Price-predictTest)^2)
SST = sum((wineTest$Price - mean(wineData$Price))^2)
r_squared = 1- SSE/SST
r_squared
## compare the rsquared for test data with the actual data and if both r-squared values are both almost same
## then the model is a better model, in our current data the test data is very less[only 2 observations] so its not correct
## to make a prediction with this test data

