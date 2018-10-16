#Chapter 6: Linear Model Selection and Regularization
#I want to put more focus on this lab in particular b/c I struggled significantly with Chapter 6. 

#Best Subset Selection

library(ISLR)
#use Hitters data set
Hitters=na.omit(Hitters) #removes rows with missing data

#regsubsets() function performs best subset selection. Same syntax as lm(). This is from leaps library
library(leaps)
full=regsubsets(Salary~.,Hitters)
summary(full)
#in summary(), "*" indicates that the variable is included in the model
#e.g. in 2-variable model, the best predictors are Hits and CRBI
#regsubsets() only gives up to 8-variable models, 
#put nvmax=v in the end of regsubsets argument to fit a v-variable model...for example
evenfuller=regsubsets(Salary~.,data=Hitters,nvmax=19)
smry=summary(evenfuller)
smry$rsq #R2 values corresponding to number of variables
