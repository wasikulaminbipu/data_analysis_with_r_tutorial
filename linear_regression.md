# Steps for Statistical Analysis
## Steps in Linear Regression
### Step I : Histogram
Code for the histogram
```
hist()
```
Check for histogram to see if there is any error or unlikely value in the database

### Step II : Summerise Data
Code for summerizing data
```
summary(Data)
```
Must print the summary to see the data
```
print(summary(Data))
```
### Step III : Listing Basic Data
Code for listing Basic Data
```
list("Summary"=summary(Data), "Mean"=mean(Data, na.rm=TRUE), "Standard Deviation"=sd(Data, na.rm=TRUE, "Range"=range(Data, na.rm=TRUE),"Inter Quartile Range"=IQR(Data, na.rm=TRUE)))
```
You can show the data to console by print statement

### Step IV : Scatter Plot
Code for scatter plot
```
plot()
```
Scatter Plot is necessary to see if there is any association between two variables. And Decide which type of analysis you need. 

- If there is linearity go for Pearsons Linear Regression
- If there is monotonous relation go for Spearman Regression

### Step V : Perform Correlation Test
Code for Pearson's Correlation
```
cor.test(Value1,Value2, use="complete.obs", method="pearson")
```
Code for Spearman's Correlation
```
cor.test(Value1,Value2, use="complete.obs", method="spearman")
```
Print the correlation to see the result on console

### Step VI : Create Model

#### Linear Regression Model
To Create Linear Regression Model use the following code
```
ModelName <- lm(Var1~Var2, data=Data)
```
#### Multiple Regression Model
To create Multiple Regression Model use the following code
```
ModelName <- lm(Var1~Var2+Var3, data=Data)
```
#### Summary
Now you can print the summary of the model by running
```
print(summary(ModelName))
```
#### Confidence Interval
You can get 95% confidence interval by the following code
```
print(confint(ModelName))
```
#### Predictor
You can get the predictor value by the following command
```
predictModelName <- predict(ModelName)
```
Then you can check the value by histogram
```
hist(predictModelName)
```
#### Residuals 
You can get the residuals value by the following command
```
residualsModelName <- residuals(ModelName)
```
You can now check the residuals by histogram
```
hist(residualsModelName)
```
You can also summerize the residuals by `summary()` command

### Step VII : Create Plot of the Created Model
Code for creating plot for the Correlation
```
plot(ModelName)
```
to show multiple plot in a same graph use
```
par(mfrwo=c(row,col))
```
and then run the `plot()` command

### Step VIII : Check for Variable Inference Factor VIF
To check colinearity between variables we need to check VIF by following command
```
library(mctest)
imcdiag(Data)
```
Higher VIF value means higher chances colinearity

