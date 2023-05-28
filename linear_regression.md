# Linear Regression
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
  
    
      
## Inspection of Model Fit
## Inspecting Basic Database Features
### Getting No of Rows and Colums
Code for getting no of rows and colums is
```
dim(Data)
```
### View some data
Code for getting first few rows
```
head(Data)
```
### Checking the data type
Data types can be checked by the following code
```
class(Data$ColumnName)
```
### Change the data type where required

#### Changing from continuous to categorical
There are two ways to change continuous variable to categorical. First one is to store it in a different variable by the follwing code
```
newCatData <- as.factor(Data$ColumnName)
```
another way is to use it directly with `factor()` function. Here is an example
```
factor(Data$ColumnName)
```

#### Changing from Categorical to Continuous
To change data from categorical to continuous use the following code
```
newData <- unclass(Data$ColumnName)
```
### Basic Inspection for Continuous Data

#### Checking Summary of the Specific Data
To check specific data type following code
```
summary(Data$ColumnName)
```
#### Visualize data using histogram
To generate histogram run following code
```
hist(Data$ColumnName)
```
### Basic Inspection for categorical Data

#### View total no entries each category
To view table of total entries in each category following code is required
```
table(Data$ColumnName)
```
#### View structure of the variable
To view structure of the variable the following code is required
```
str(Data$ColumnName)
```
#### Changing Reference Category
To change reference category following code is required
```
Data$ColumnName <- relevel(Data$ColumnName, ref= refNo)
```
### Creating New Variables from Old one

#### Create Categorical Variable based on Numeric Value
To create categorical variable from numeric values try the following steps

##### Step I : Create new variable with required length
To create variable as the same length of other variable use code
```
newVar <- length(Data$OldVar)
```
##### Step II: Check Condition and Assign Value
Now check all the conditions and assign a value for the condition
```
newVar[Condition1 | Condition2] <- Value 
```
Repeat the condition to fill all the data available

##### Step III: Assign a value where no value is assigned
To assign a value in every empty field you need following code
```
newVar[ is.na(newVar) ] <- Value
```
### Save new Variable to the existing data set
To save new variable to the existing data set use the following code
```
Data$newVar <- newVar
```
## Inspecting whole DataSet

### Inspecting for missing values and outliers

#### For continuous variables
To inspect for missing values and outliers use the following code
```
library(Hmisc)
describe(Data)
```
You must install Hmisc package if not installed

#### For categorical variables
Need to use Cross Table to inspect Data. The following code is necessary
```
library(gmodels)
CrossTable(Data$ColumnName)
```
To check for missing values
```
sum(is.na(Data$Column Name))    
```

## Examining Relationship between variables

### Relationship between continuous variables

#### Step I: Create a correlation matrix
Correlation matrix can be created by the following code
```
corMat <- Data[ , c("field1", "field2",.....)]
``````
#### Step II: Create correlation of the matrix
Correlation can be created by the following 
```
corData <- cor(corMat)
```
#### Step III: View Correlation
Correlation can be viewed by `print()` or `View()` function
```
print(corData)
```
the data can be rounded by
```
round(corData,2)
```
#### Step IV: Visualize Correlation
The correlation can be visualized by the following command
```
pairs(~field1+field2+..., data=Data)
```
### Relationship between categorical variables

#### Step I: Describe the factor Variable
Factor variable can be described by the following command
```
library(Hmisc)
describe(Data$ColumnName)
```
#### Step II: Creating CrossTable
Need to use Cross Table to inspect Data. The following code is necessary
```
library(gmodels)
CrossTable(Data$ColumnName)
```
To check for missing values
```
sum(is.na(Data$Column Name))
```







