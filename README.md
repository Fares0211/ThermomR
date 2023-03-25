# thermomR : Implémentation d'une fonction prédictive de la température de l'air sur RStudio.
Projet de mathématiques appliquées.

--------------

Part I : Theoretical questions
 1
The simple linear regression allows to explain a quantitative variable Y by only one regressor X : Y =β0+β1X+ε with ε∼N(0,σ2).
The variable X is assumed to be deterministic whereas Y and ε are random
To estimate the parameters of the model β0 and β1 and σ, we have n observations (y1, x1), . . . , (yn, xn). The variables εi are assumed to be independent and follow the same law. The least squares estimators
of β0 and β1 are defined by :
􏰀ni=1(xi − x ̄)(yi − y ̄) β0 = y ̄ − β1x ̄ β1 = 􏰀ni=1(xi − x ̄)2
􏰀n 2 the estimator of σ2 is given by σˆ2 = i=1 eˆi .
ˆˆˆ
  n−2
1
1. 2. 3.
2
2.1
What is the law of the random variables (βˆ0, βˆ1) ?
Are the variables Yi independent ? Are they identically distributed ? Justify your answer
[graded question] Give a practical example where this model can be used. What does the target variable Y represent ? How about the regressor X ?
Part II : Practical applications
Simple Linear Regression
2.1.1 Preliminary study
In this section, you will fit a linear model to predict the ozone content according to other meteo- rological variables. In moodle, you will find a text file attributed to your TD group called ozone.txt. This dataset file contains the following variables :
— the maximum content of ozone measured during the day (maxO3), — the temperature at noon (T12),
— the nebulosity at noon (Ne12) and
— the maximum content of ozone the day before (maxO3v).
Exercise 1. Open the text file and save it in your working directory. Import the data into a data frame that you will name oz.
— In R use the read.table command. You can use the command attach(oz) to be able to use directly the variable names.
— In Python, use the function read_csv() function from the pandas library.
[ graded question] How many observations does this dataset contain ? How many variables are there ?
Exercise 2. Calculate descriptive statistics for all the variables in the dataset :
— In R you can use the function summary() to produce a descriptive statistics of each variable. In
addition, use the plot() function to plot the scatter plot of the variables.
— In Python, the command oz.describe() allows to calculate descriptive statistics. In addition, the function scatter_matrix() of the pandas library.
Interpret the scatter plot.
[ graded question] What are the values of the mean, the quartiles, the maximun and minimum of the maximum content of ozone during the day ?. On your own words interpret the scatter plot.
Now, you will calculate the correlation matrix for all the features in the dataset.
[graded question] Which variable is correlated the most with the ozone content maxO3 ? Interpret the correlation coefficient.
— In R, use the function cor() to calculate the empirical correlation matrix.
— In Python, the command oz.corr() allows to calculate the empirical correlation matrix.
         2

2.1.2 Fit of the model and goodness of fit
Exercise 3. In this exercise you will fit a simple linear model with only one regressor, the nubelosity,
to predict the ozone content.
— In R Using the lm() function to fit the model : maxO3 = β0 + β1Ne12 + ε. You will denote the
output of the lm function oz.regsimple.
— In Python, you will use the module statsmodels, a module that supports specifying models
using R-style formulas and pandas DataFrames :
import statsmodels . api as sm
lm = sm.OLS.from formula(’maxO3  ̃ Ne12’, oz)
oz regsimple = lm. fit () print oz regsimple .summary()
[graded question] What are the coefficients estimates? Interpret coefficient estimate βˆ1.
In addition you can draw the scatter plot between maxO3 and Ne12 and add the regression line just fitted. To this end, in R you can use the plot() and the abline() functions. In Python You can use the function to Use the abline command to add to the scatter plot. Whereas in Python you can use the code matplotlib library :
import matplotlib . pyplot as plt
plt.scatter(oz.Ne12, oz.maxO3)
plt.plot([x,x], [x,x], ’k−’, color = ’r’) #plot 2 points of the fitted line
Exercise 4. Confidence intervals (IC) for the parameters
[graded question] Give the general expression of a 1 − α confidence interval for the parameter β1. Calculate the 90% confidence interval for this coefficient. Interpret the results.
— In R the confint() command allows to calculate confidence intervals for the model parameters. — In Python you can use the command oz_regsimple.conf_int(alpha= )
Exercise 5. You can obtain a summary report of the fitting by running :
— the command summary(oz.regsimple) in R.
— the command oz_regmult.summary() in Python and printing the output.
You will obtain the following table :
Estimate Std. Error t value P r(> |t|)
                             (Intercept)
Ne12
βˆ σˆ statistict p-valueofthetestH :β =0 0ˆβ00
β0 0
βˆ σˆ statisticT p-valueofthetestH :β =0 1ˆβ01
β1 1
1. [graded question] What can you say about the estimated variances of the estimated coefficients ?
2. [graded question] Elaborate the zero slope hypothesis test and conclude if there is a relationship between the between the maximum content of ozone the day before maxO3v and the nebulosity Ne12. Is β1 significantly non zero ?
3. [graded question] Interpret the value of R2. What can you say about the quality of the model?
3

2.2 Multiple Linear regression
In this section you will perform linear regression with more than one regressor and compare this model to that obtained by fitting simple linear regression.
Exercise 6. Fit the regression model on two predictors : the nebulosity Ne12 and the maximum content of ozone the day before maxO3v.
maxO3 = β0 + β1Ne12 + β2maxO3v + ε
You can use the same functions used for simple linear regression with the formula :
’maxO3 ∼ Ne12 + maxO3v’ You will call the output of the function oz.regmult.
[graded question] What are the coefficient estimates? Give an interpretation to these coefficients. Perform the zero slope hypothesis test.
2.2.1 Making predictions
Exercise 7. We would like to predict the ozone content for tomorrow. Today the maximal ozone
content is 80 and the weather forecast estimates the nebulosity tomorrow at noon will be 6.
[graded question] What is the predicted value of maxO3? Use the simple and the multiple regression models previously fitted. Compare both results.
—
—
In R the predict.lm() function predicts the estimated values of the target variable for new values of the regressors. It takes as input value at least an object of type lm() and a data frame with the new values. To create a new dataframe you can run the command new.data <- data.frame(Ne12=6,maxO3v=80).
In Python use the predict() function after creating a dataframe with the new values using the DataFrame() function of the pandas library.
          Coefficient of determination R2
In the lecture we defined the coefficient of determination R2 and the adjusted coefficient of de-
termination R ̄2 to evaluate the goodness of fit of our model. Exercise 8.
1. [graded question] What do the coefficients R2 and R ̄2 measure? In your opinion, which one is more adapted to compare the models oz.regsimple to the oz.regmult ?
2. [graded question] The summary report gives you the R2 and the R ̄2 coefficients of your models. Which model would you choose to predict the ozone content for tomorrow ?
Answer :
