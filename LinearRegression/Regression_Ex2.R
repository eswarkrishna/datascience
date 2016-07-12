## Example 2 for NBA Data
setwd("C:\\Users\\Documents\\linear regression")

nba = read.csv("NBA_TRAIN.csv")
str(nba)
table(nba$W,nba$Playoffs)
nba$ptsdiff = nba$PTS -nba$oppPTS

plot(nba$ptsdiff,nba$W)
winReg = lm(W ~ ptsdiff,nba)
summary(winReg)

## w= 41+0.0326*ptsdiff

str(nba)
pointsReg = lm(PTS ~ X2PA + X3PA + FTA + AST + ORB + DRB + TOV + STL+BLK,nba)
summary(pointsReg)
pointsReg$residuals
SSE = sum(pointsReg$residuals^2)
SSE
RMSE = sqrt(SSE/nrow(nba))
RMSE
mean(nba$PTS)
pointsReg2 = lm(PTS ~ X2PA + X3PA + FTA + AST + ORB + DRB + STL+BLK,nba)
summary(pointsReg2)
pointsReg3 = lm(PTS ~ X2PA + X3PA + FTA + AST + ORB + STL+BLK,nba)
summary(pointsReg3)

pointsReg4 = lm(PTS ~ X2PA + X3PA + FTA + AST + ORB + STL,nba)
summary(pointsReg4)
SSE4 = sum(pointsReg4$residuals^2)
SSE4
RMSE4 = sqrt(SSE4/nrow(nba))
RMSE4


nba_test = read.csv("nba_test.csv")
PointsPrediction = predict(pointsReg4,nba_test)
#Out of sample R Squared
SSE = sum((PointsPrediction-nba_test$PTS)^2)
SST = sum((mean(nba$PTS)-nba_test$PTS)^2)
R_SQRD = 1 - SSE/SST
R_SQRD
RMSE = sqrt(SSE/nrow(nba_test))
RMSE
