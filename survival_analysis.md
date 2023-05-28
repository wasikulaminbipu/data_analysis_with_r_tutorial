# Survival Analysis Tutorial
There are several Types of survival analysis. Some of them are described here...
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
