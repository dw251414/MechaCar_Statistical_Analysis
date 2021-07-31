# MechaCar_Statistical_Analysis

## Project Overview
This project involves the use of statistics and hypothesis testing to analyze a series of datasets from the automotive industry.\
All of the statistical analysis and visualizations is written in the R programming language.

## Resources
- Data Source: [MechaCar_mpg.csv] & [Suspension_Coil.csv] *referenced in Main
- Software: RStudio 1.4.1717
---
### Linear Regression to Predict MPG

<p align="center">
<img width="807" alt="Screen Shot 2021-07-31 at 12 21 30 PM" src="https://user-images.githubusercontent.com/82069038/127746625-8576bc41-802c-4e29-9b56-713cbf9e8695.png">
</p>

- In the summary output, each Pr(>|t|) value represents the probability that each coefficient contributes a random amount of variance to the linear model. According to our results vehicle length and ground clearance (and Intercept) provide a non-random amount of variance to the linear model of mpg.

- According to the results, the multi linear model is:
```
mpg = 6.27 * vehicle_length + 1.25e-3 * vehicle_weigth + 6.88e-2 * spoiler_angle -3.41 * AWD + 3.55 * ground_clearance - 1.04e+2
```
Approximation:

```
mpg = 6.27 * vehicle_length - 3.41 * AWD + 3.55 * ground_clearance - 104
```
This linear model's slope is not considered to be zero.

- R-square is 0.71 so 71% of the variations in mpg can be explained by changes in the vehicle length, the vehicle weight, the spoiler angle, the drivetrain and the ground clearance. This linear model efficiently predicts mpg of MechaCar prototypes.

<br>

### Summary Statistics on Suspension Coils

  - All manufacturing lots:
<p align="center">
<img width="806" alt="Screen Shot 2021-07-31 at 12 24 55 PM" src="https://user-images.githubusercontent.com/82069038/127746675-93cd3e3c-5ba2-40b3-a954-eaf894528e23.png">
</p>

  - By each manufacturing lot:
<p align="center">
<img width="718" alt="Screen Shot 2021-07-31 at 12 25 38 PM" src="https://user-images.githubusercontent.com/82069038/127746693-ba54054a-95f7-4871-a2de-10a8e2eecfa9.png">
</p>

Design specs for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch.\
Design specs are respected for all manufacturing lots in total with a global variance of 62.3 psi.\
Lot 1 and Lot 2 are into specs with respectively variances of 0.98 and 7.5 psi. The Lot 3 is out of specs with a variance of 170.3 psi.

<br>

### T-Tests on Suspension Coils

#### T-Test all manufacturing lots against the population mean

<p align="center">
<img width="657" alt="Screen Shot 2021-07-31 at 12 27 28 PM" src="https://user-images.githubusercontent.com/82069038/127746717-caef56c5-65a2-42a8-9ebc-9a1d828d0185.png">
</p>

Assuming our significance level is 0.05 percent, our p-value of 0.069 is above the significance level. Subsequently, we do not have convincing support to reject the null hypothesis, and we can state that the PSI across all manufacturing lots is statiscally similar to the population mean of 1498.78 psi.

#### T-Tests each manufacturing lot against the population mean

#### Lot1

<p align="center">
<img width="663" alt="Screen Shot 2021-07-31 at 12 27 41 PM" src="https://user-images.githubusercontent.com/82069038/127746727-f3757de2-cf7f-4200-81f7-b7ff987b339f.png">
</p>

Here the p-value is below the significance level of 0.05 percent, so we can reject the null hypothesis and conclude that the PSI across the Lot 1 is statistically different from the population mean.

#### Lot2 & Lot3

<p align="center">
<img width="663" alt="Screen Shot 2021-07-31 at 12 27 54 PM" src="https://user-images.githubusercontent.com/82069038/127746734-912b3e07-33ac-48c2-94ae-b2f53f34408f.png">
</p>

<p align="center">
<img width="664" alt="Screen Shot 2021-07-31 at 12 28 06 PM" src="https://user-images.githubusercontent.com/82069038/127746743-6da773d4-0203-4001-b0a8-3736a25ab161.png">
</p>

Here both p-values are above the significance level, so we can conclude that the PSI for Lot2 and Lot3 are statistically similar to the population mean.

### Study Design: MechaCar vs Competition
To compare the performance of the MechaCar prototype against the vehicles from the competition, we will perform a statistical analysis based on the following metrics: 
- the "0 to 60 mph" time,
- the braking distance,
- the fuel economy (mpg),
- the Power,
- the safety rating.

In our case the null hypothesis would be: each performance metrics is statistically similar between the MechaCar prototype and all vehicle from the other manufacturers.

Using a one-way ANOVA test, this test compares the means of a continuous numerical variable across a number of groups.\
For this analysis we would compare the means for each metric across the different manufacturers.

Performing this test, we would need data of MechaCar vehicles and its competition, all gathered in a single dataframe where each metric is a column.\
The data could be scraped from vehicle data APIs such as:
[scrapinghub.com/data-api-vehicle](https://www.scrapinghub.com/data-api-vehicle/) or [carqueryapi.com](https://www.carqueryapi.com/).
