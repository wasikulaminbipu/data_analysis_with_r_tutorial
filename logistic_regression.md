# Logistic Regression

## Preparing Data

## Step I: Import Data & Basic Checkup
- Data Import by `read.csv()` or any other import function
- Check Total Rows and Columns by `dm(data)` function
- Remove missing values by `na.omit(data)` function
- Get Column Names by `colnames(data)` function
- Generate summary by `summary(data)` function

Don't forget to `print()` for getting results


## Step II: Data Preparation & Conversion

### Data Conversion & Creating New Variables

Save specific column in a new variable by
    newData <- data[,"columnName"]

Detect all the categorical data and convert it to `factor()`
    newData <- as.factor(data[,"colName"])


### Checking & Summerizing Data

### For Categorical Data

Create Table for all the factor type data
    t <- table(newColData)


For including all the null variables
    t <- table(newColData, exclude= NULL)

Get the summary with the table through
    addmargins(t)

Get Proportion or Percentage of the data by
    prop.table(t)

Make it round
    round(prop.table(t), digits= 3)

Get in percentage format
    round(100 * prop.table(t), digits = 3)

### For Continuous Data

Summerize the data
    summary(colData)

Kernel Density Plot
    d <- density(Data1)
    plot(d, main="")

## Step III : Analyzing Data

### Cross Tabulation
For cross tabulation following code is needed
    table(colData,rowData, exclude=NULL)

Cross tabulation percentage
    round(100 * prop.table(tableData), digits = 2)

Though there is a problem with this. It creates a percentage based on all the data of table. If you want percentage based on column or row you must include `margin` in your code. Here is example
    round(100 * prop.table(tableData, margin = 1), digits = 2)

margin = 1 means proportion by row
margin = 2 means proportion by column
margin = NULL means proportion through full table

### Calculating Log Odds
First create cross tabulation
    a_by_b <- table(b,a)
Then, get table proportion
    prop_a_by_b <- prop.table(a_by_b, margin=1)
Next, calculate odds
    odds_data <- prop_a_by_b[,"yes"]/prop_a_by_b[,"no"]
Finally, calculate log odds
    log_odds_data <- log(odds_data)

### Generating Dot Chart
To generate dotchart we need following command
    dotchart(log_odds_data)

### Generating Plot Chart
To generate plot chart we need following command
    plot(as.factor(names(log_odds_data)), log_odds_data)

## Step IV : Checking if data is suitable

### Cross Tabulation of the data
Cross Tabulation of the selected data can be done by the following
    t <- table(Data1,Data2)

### Checking the proportion of the data
To check the proportion of the data in the table 
    pt <- prop.table(t,margin = 1)

### Calculating Odds
To calculate odds in R manually, you can run
    odds <- pt[, "Col1Name" ]/pt[, "Col2Name"]

### Calculating Log Odds
To calculate log(odds) you can run the following command
    log_odds <- log(odds)

### Creating Dot Chart
To generate dot chart we need the following command
    dotchart(log_odds)

### Ploting the data
To create a plot of the data. You can run
    plot(rownames(pt),log_odds)

## Step V : Creating Logistic Regression Model

You can run logistic regression in R by following code
    regression <- glm(Data1~Data2, family = binomial(link = "logit"))

Here glm means Generalized Linear Model

You can check if the data is interpret in correct way by tabulating data
    table(regression$y)

### Interpretation of the Result
1. Call of the Algoridm
2. Deviance Residuals
3. Coefficients : Coefficients for building model
4. Dispersion Parameters : 
5. Null Deviance: Deviance for null model when only intercept is calculated
6. Residual Deviance: Deviance after the predictor variables has been added. 
Generally we try to compare it with null deviance. How much improvement has been done by investing which amount of degrees of freedom. If the model is good there will be large difference between null deviance and residual deviance
7. AIC (Akaike Information Criterion) : measures the quality of model in terms of amount of information lost. It is used for comparing two models. The model with minimum AIC value is considered as best model.
8. Fisher Scoring iteration value means how many iteration is converged or completed in the model

## Step VI : Model Fitting

### R squared measures
McFaddens R squared test can be done by 
    full_model <- glm(outcome~predictor1+predictor2+predictor3, family = binomial(link = logit))
    null_model <- glm(outcome~1, family = binomial(link = logit))
    R2 <- 1 - logLik(full_model)/logLik(null_model)
    print(R2)

Here logLik means Log Likelihood which defines how well the data is fitted.

#### Measurements of R-Squared measures
value can be 0 to 1 where 0 indicates more predictive power and 1 indicates highest predictive power. In real world the value is low.

### C statistic measures
For C statistic DescTools package is required. After installing DescTools run the following command to generate C-Statistic
    require(DescTools)
    full_model <- glm(outcome~predictor1+predictor2+predictor3, family = binomial(link=logit))
    Cstat(full_model)

#### Measurements of C-Statistics
C-Statistics can be meased by the value it provides. 0.5 value is considered random and chance of 50% whereas more than 0.5 value defines more discrimination and more fit.

### Deviance 
Deviance is default and provided with the glm functions

### Measurements for Deviance
A positive deviance residual indicates that the observed outcome was greater than the predicted outcome, while a negative deviance residual indicates that the observed outcome was less than the predicted outcome.

### Calibration : Hosmer-Lemeshow statistic and test
#### Method 1
ResourceSelection package is required for this test. After installing the package test can be performed by
    require("ResourceSelection")
    full_model <- glm(outcome~predictor1+predictor2+predictor3, family = binomial(link=logit))
    HL <- hoslem.test(x=full_model$y, y = fitted(full_model), g = 10)
    print(HL)

Here, full_model$y = outcome variable, fitted(full_model) = predicted or estimated value and g = amount in every steps

Plot can be drawn from this value also by the following code
    plot(HL$observed[,"y1"], HL$expected[,"yhat1"])
Here, yhat = predicted or estimated value for dependent variable and y =  dependent variable
Note that this plot is for step1 only. model of other steps can be drawn by similar way

Plot for noncases can be drawn by y0 and yhat0 value in the same way

plot observed vs. expected prevalence for each of the 10 groups can be done by
    plot(x = HL$observed[,"y1"]/(HL$observed[,"y1"] + HL$observed[,"y0"]), y = HL$expected[,"yhat1"] / (HL$expected[,"yhat1"] + HL$expected[,"yhat0"]))

#### Method 2
In method 2 generalhoslem package is required. After installing package following code should be run
    require("generalhoslem)
    full_model <- glm(outcome~predictor1+predictor2+predictor3, family = binomial(link=logit))
    HL <- logitgof(obs = full_model$y, exp=fitted(fullmodel), g = 10)
    print(HL)

Here obs = observed, exp= expected

### Analyze Deviance
Deviance parameters can be analyzed by chi squared test. Code is written below
    anova(full_model, test="Chisq")
#### Interpretation
In the result 
1. df= degrees of freedom : it shows which variables took how much degrees of freedom; 
2. Deviance : it shows how much deviance have got after investing df ; 
3. Residual Df: it shows Residuals Degress of freedom by subtracting df taken; 
4. Residual Deviance : it shows Residuals Deviance after investing df, generally it is subtraction of deviance decreased from total deviance; 
5. Pr = P value : if the p value is low it is showing corresponding added variables causes a significant change and thus is a better fitting model

## Step VII : Selection of the Predictor Variables

### Backward Elimination
In Backward Elimination following procedure is followed
- Creating model with all the predictor
- Check the result of the model.
- Remove all the predictor with high p value (>0.05) 
- check the model again and repeat the process

If significant variable is removed from the model in this method then you must follow
- test correlation of the variable with other predictors in the model using `cor.test()` function
- if correlation is found decide which predictor is more important for your model
- run the model again and repeat the steps
