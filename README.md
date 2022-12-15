# MechaCar_Statistical_Analysis
## Overview: Review production data for insights that may help the manufacturing team
### The purpose of this analysis is to identify which variables in the dataset predict the mpg of MechaCar prototypes, collect summary statistics on the pounds per square inch of the suspension coils from the manufacturing lot, determine if the manufacturing lots are statistically different from the mean population, and design a statistical study to compare vehicle performance of the MechaCar vehicles against vehicles from other manufacturers. 

## Linear Regression to Predict MPG
To idenitfy which variables in the dataset predict the mpg of MechaCar prototypes, I ran a multiple linear regression. 

Code:
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,mechacar_mpg))

By running a multiple linear regression, I was able to look at the variance of all the variables/coefficients against mpg. Considering the significance level (p) of 0.05, the analysis indicates that vehicle length (p=2.60e-12) and ground clearance (p=5.21e-08) both provided a non-random amount of variance to mpg, Image 1. Vehicle length and ground clearance both have p-values or significance levels of less than 0.05, indicating these two variables are significant in predicting mpc of MechaCar prototypes. 

### Image 1: Multiple Linear Regression
![Multiple Linear Regression](https://github.com/mrma2318/MechaCar_Statistical_Analysis/blob/b5dabdbad9851b6fe3cfe0391a831d4b476b882c/images/linear_regression.png)

Looking at Image 1 of the multiple linear regression, the Intercept value in the chart indicates the y-intercept or slope of the linear model. The p-value or significance level of the Intercept is also smaller than 0.05, with p=5.08e-8. The p value is so small, it's smaller than a significance level of 0.001, but it's not zero. The y-intercept p-value tells us the significance of all the predictors being equal to zero. Since we have significant predictors for mpg, then our y-intercept wouldn't be equal to zero. However, because our significant predictors, vehicle length and ground clearance, are also both smaller than a significance level of 0.001, explains the small y-intercept value as well. 

This linear model effectively predict mpg of MechaCar prototypes. When running a linear regression, we are also looking at the correlation and whether or not it's close to a positive 1 or negative 1. In Image 1, the R quared value of 0.7 is closer to a positive 1 than zero, showing a positive correlation in prediciting mpg of MechaCar prototypes. Therefore, this linear model does a good job in prediciting mpg with the variables we have. 

## Summary Statistics on Suspension Coils
The design specification for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. To understand if our current manufacturing data meet this design specification, I needed to collect summary statistics on the pounds per square inch (PSI) of the suspension coils from each manufacturing lot(s). 

First, I needed to find the suspension coil's PSI across all manfacturing lots, Table 1. 

Code:
total_summary <- suspension_coil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

### Table 1: Total Summary Table
![Total Summary Table](https://github.com/mrma2318/MechaCar_Statistical_Analysis/blob/b5dabdbad9851b6fe3cfe0391a831d4b476b882c/images/total_summary.png)

In the total summary table you can see that the variance is 62.3, which is less than 100. Therefore, overall the lots combined variance meet the specifications. Then I wanted to look at each manufacturing lots mean, median, variance, and standard deviation individually of the suspension coil's PSI, Table 2. 

Code:
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

### Table 2: Lot Summary Table
![Lot Summary Table](https://github.com/mrma2318/MechaCar_Statistical_Analysis/blob/b5dabdbad9851b6fe3cfe0391a831d4b476b882c/images/lot_summary.png)

In the lot summary table, Lot 1 has a variance of 1 and Lot 2 has a variance of 7.5, which are both below 100. Therefore, Lots 1 and 2 both meet the specifications  of the suspension coils. However, Lot 3 has a variance of 170.3, which is exceeds the 100 pounds per square inch, indicating Lot 3 doesn't meet the specification requirements. 

To summarize, the variance of all the lots combined meet the specifications for suspensions coils. However, if you look at each lot individually, lot 3 does not meet the suspension coil specifications so it's better to look at manufacturing lots separately than combined.

## T-Tests on Suspension Coils
To determine if all the manufacturing lots and each lot individually are statistically different from the population mean of 1,500 pounds per square inch I used the one sample t-test. First, I looked at all the manufacturing lots, Image 2. 

Code: 
t.test(suspension_coil$PSI,mu=1500)

### Image 2: One Sample t-Test for all Lots
![One Sample t-test all Lots](https://github.com/mrma2318/MechaCar_Statistical_Analysis/blob/b5dabdbad9851b6fe3cfe0391a831d4b476b882c/images/t-test_all_lots.png)

From the analysis, the p-value for all the manufacturing lots is greater than the significance level of 0.05 with p=0.06. Therefore, all the lots together are not significantly different from the population mean. However, if we look at each lot indivdiually, similar to how we looked at the different lots when looking at suspension coil specifications, we might see statistical differences from the population mean. 

I needed to use the subset() function in my original t-test script and then specify which lot I wanted to run the analysis on, Image 3. 

Code: 
t.test(subset(suspension_coil,Manufacturing_Lot=='Lot1')$PSI,mu=1500)

### Image 3: One Sample t-Test for Lot1
![One Sample t-Test for Lot1](https://github.com/mrma2318/MechaCar_Statistical_Analysis/blob/b5dabdbad9851b6fe3cfe0391a831d4b476b882c/images/t-test_lot1.png)

Once I ran the analysis, manufacturing lot 1 had a p-value of 1, also indicating it was not significantlly different from the population mean. To look at lots 2 and 3, I just needed to change the lot in the t-test script that I used for lot 1, to find the analysis for lots 2 and 3, Images 4 and 5. 

Code: 
t.test(subset(suspension_coil,Manufacturing_Lot=='Lot2')$PSI,mu=1500)

t.test(subset(suspension_coil,Manufacturing_Lot=='Lot3')$PSI,mu=1500)

### Image 4: One Sample t-Test for Lot 2
![One Sample t-test for Lot 2](https://github.com/mrma2318/MechaCar_Statistical_Analysis/blob/b5dabdbad9851b6fe3cfe0391a831d4b476b882c/images/t-test_lot2.png)

### Image 5: One Sample t-Test for Lot 3
![One Sample t-test for Lot 3](https://github.com/mrma2318/MechaCar_Statistical_Analysis/blob/b5dabdbad9851b6fe3cfe0391a831d4b476b882c/images/t-test_lot3.png)

The one sample t-test for lot 2 has a p-value of 0.61 which is larger than the statistical level of 0.05. Therefore, lot 2 is not not statistically different from the population mean either. However, lot 3 has a p-value of 0.04 which is smaller than the statistical level of 0.05. While lots 1 and 2 were not statistically different, lot 3 indicates that it is statstically different than the population mean. 

Overall, if you combine all the lots together they are not significantly different from the population mean. Looking at them individually though, lot 3 shows a significant difference from the population mean of 1,500 pounds per square inch. 

## Study Design: MechaCar vs Competition
I want to design a statistical study to compare performance of the MechaCar vehicles against performance of vehicles from other manufactuers. I'll want to use the MechaCar mpg data and also test highway fuel efficiency, vehicle type, cost, and horse power. These additional metrics will help identify ideal vehicle performance.   

For this statistical study I would use the following hypotheses:

H0: There is no statistical difference between MechaCar and their competitors.

Ha: There is a statistical difference between MechaCar and their competitiors.

Since I am comparing the means between two populations, I will use the two-sample t-Test to test my hypotheses. To run my analysis, I will need the MechaCar data along with the additional data for highway fuel efficiency, vehicle type, cost, and horse power. By comparing these metric means from MechaCar against their competitors, we can see if there are any statistical differences. 