# Survival Analysis Tutorial
There are several Types of survival analysis. Some of them are described here...
## Preparing Data for analysis
1. To prepare data for survival analysis, several test should be done. At first we must see whats in the data sheet by following code
    ```
    view(data)
    ```
2. Then check each variable by `summary` (for continuous variables) or `table` (for categorical variables) function.
3. Check the proportion of data in each category (for categorical variables only) by following code
    ```
    round(100*prop.table(variable), digits=2)
    ```
4. Checking relation of categorical data through cross tabulation by the following code
    ```
    round(100*prop.table(variable,death), digits=2)
    ```
5. Test correlation between different variables

## Fixing issues with variables
Fixing issues for different variables can be done by different methods. You must decide which is best suited.
1. Grouping Data in categories: 
2. Combining Different groups: Combining less important group or group with lower frequency of data can be combined with groups that is related to that group.
    ```
    variable[condition] <- newValue or category
    ```
3. Exclude some data
    ```
    variable[condition] <- NA
    ```
4. Exclude offending variable
    
5. Change Reference Category: You can change the reference category by the following code
    ```
    relevel(variable,ref="newRefNameOrNo")
    ```

## Kaplan Meteor Plot (KM Plot)
Survival Package is required for survival analysis as it is not available with default R. After installing the package. Type the following code
```
require("survival") 
data_seperator_fit <- survfit(SurvFunction~Seperator)
```
To view the result of the Kaplan Meteor Model we need to create a plot or summerize the data. At first we will try to summerize the data by following code
```
summary(data_fit)
```
This will summerize the whole model which is verbose most of the time. To view the result as we need we can use `times` argument in the summary. Examples are here
```
summary(data_fit, times = c(1:7,30,60,90*(1:10)))
```
In this example we are trying to view data of first week (1-7)days, 30th day, 60th day & finally each 90 day interval

### Survival Function
We need a survival function for the test. So, we will create a survival function first. Survival Function will create survival object by provided timeframe and status. Examples are here
```
Surv(time,status)
```

## Log Rank Test
Log Rank test is a Hypothesis test to compare survival distribution. It is used to determine if there is a statistically significant difference between the survival distribution of two groups. Though the function name is somewhat misleading we can test it by 
```
survdiff(SurvFunction~Separator, rho = 1)
```

Here `rho` is correlation coefficient of two groups being compared.

## Cox Model (Cox Proportional Hazard Model)
Cox Model is most important model for survival analysis. It also requires `survival` package. After installing the package, type the following code to create cox model
```
require('survival')
cox_model <- coxph(Surv(time,status)~separator, data=Data) #takes from data directly
summary(cox_model)
```
Cox model with multible separator can be created by the following code
```
require('survival')
cox_model <- coxph(Surv(time,status)~separator1+separator2+..., data=Data) #takes from data directly
summary(cox_model)
```



