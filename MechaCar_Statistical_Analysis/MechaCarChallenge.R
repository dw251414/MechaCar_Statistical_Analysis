> library(tidyverse) #import tidyverse package
> 
> mechaCarData <- read_csv("MechaCar_mpg.csv") #import MechaCar data

── Column specification ───────────────────────────────────────────────────────────────────────────
cols(
  vehicle_length = col_double(),
  vehicle_weight = col_double(),
  spoiler_angle = col_double(),
  ground_clearance = col_double(),
  AWD = col_double(),
  mpg = col_double()
)

> lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + AWD + ground_clearance,data=mechaCarData) #generate multiple linear regression model

Call:
lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
    AWD + ground_clearance, data = mechaCarData)

Coefficients:
     (Intercept)    vehicle_length    vehicle_weight     spoiler_angle               AWD  
      -1.040e+02         6.267e+00         1.245e-03         6.877e-02        -3.411e+00  
ground_clearance  
       3.546e+00  

> summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + AWD + ground_clearance,data=mechaCarData)) #generate summary statistics

Call:
lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
    AWD + ground_clearance, data = mechaCarData)

Residuals:
     Min       1Q   Median       3Q      Max 
-19.4701  -4.4994  -0.0692   5.4433  18.5849 

Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)      -1.040e+02  1.585e+01  -6.559 5.08e-08 ***
vehicle_length    6.267e+00  6.553e-01   9.563 2.60e-12 ***
vehicle_weight    1.245e-03  6.890e-04   1.807   0.0776 .  
spoiler_angle     6.877e-02  6.653e-02   1.034   0.3069    
AWD              -3.411e+00  2.535e+00  -1.346   0.1852    
ground_clearance  3.546e+00  5.412e-01   6.551 5.21e-08 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 8.774 on 44 degrees of freedom
Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11

> suspension_coil_data <- read_csv("Suspension_Coil.csv") #import suspension coil data

── Column specification ───────────────────────────────────────────────────────────────────────────
cols(
  VehicleID = col_character(),
  Manufacturing_Lot = col_character(),
  PSI = col_double()
)

> head(suspension_coil_data)
# A tibble: 6 x 3
  VehicleID Manufacturing_Lot   PSI
  <chr>     <chr>             <dbl>
1 V40858    Lot1               1499
2 V40607    Lot1               1500
3 V31443    Lot1               1500
4 V6004     Lot1               1500
5 V7000     Lot1               1501
6 V17344    Lot1               1501
> total_summary <- suspension_coil_data %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create total summary table
> total_summary
# A tibble: 1 x 4
   Mean Median Variance    SD
  <dbl>  <dbl>    <dbl> <dbl>
1 1499.   1500     62.3  7.89
> lot_summary <- suspension_coil_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create lot summary table
> lot_summary
# A tibble: 3 x 5
# Groups:   Manufacturing_Lot [3]
  Manufacturing_Lot  Mean Median Variance     SD
  <chr>             <dbl>  <dbl>    <dbl>  <dbl>
1 Lot1              1500   1500     0.980  0.990
2 Lot2              1500.  1500     7.47   2.73 
3 Lot3              1496.  1498.  170.    13.0  
> global_sample_table <- suspension_coil_data %>% sample_n(50) #randomly sample 50 data points
> plt <- ggplot(suspension_coil_data,aes(x=PSI)) #import all coil data into ggplot2
> plt + geom_density() #visualize distribution with density plot
> plt <- ggplot(global_sample_table,aes(x=PSI)) #import sample coil data into ggplot2
> plt + geom_density() #visualize distribution with density plot
> plt <- ggplot(global_sample_table,aes(x=log10(PSI))) #import sample coil data into ggplot2
> plt + geom_density() #visualize distribution with density plot
> t.test(global_sample_table$PSI,mu=mean(suspension_coil_data$PSI)) #compare sample versus population mean

	One Sample t-test

data:  global_sample_table$PSI
t = 0.91671, df = 49, p-value = 0.3638
alternative hypothesis: true mean is not equal to 1498.78
95 percent confidence interval:
 1497.659 1501.781
sample estimates:
mean of x 
  1499.72 

> psi_lot1_sample <- suspension_coil_data %>% subset(Manufacturing_Lot=='Lot1') %>% sample_n(25) #create a sample table of 25 data points with Lot 1
> t.test(psi_lot1_sample$PSI,mu=mean(suspension_coil_data$PSI)) #compare Lot1 sample versus population mean

	One Sample t-test

data:  psi_lot1_sample$PSI
t = 7.4157, df = 24, p-value = 1.176e-07
alternative hypothesis: true mean is not equal to 1498.78
95 percent confidence interval:
 1499.805 1500.595
sample estimates:
mean of x 
   1500.2 

> psi_lot2_sample <- suspension_coil_data %>% subset(Manufacturing_Lot=='Lot2') %>% sample_n(25) #create a sample table of 25 data points with Lot 2
> t.test(psi_lot2_sample$PSI,mu=mean(suspension_coil_data$PSI)) #compare Lot2 sample versus population mean

	One Sample t-test

data:  psi_lot2_sample$PSI
t = 2.1803, df = 24, p-value = 0.03927
alternative hypothesis: true mean is not equal to 1498.78
95 percent confidence interval:
 1498.852 1501.388
sample estimates:
mean of x 
  1500.12 

> psi_lot3_sample <- suspension_coil_data %>% subset(Manufacturing_Lot=='Lot3') %>% sample_n(25) #create a sample table of 25 data points with Lot 3
> t.test(psi_lot3_sample$PSI,mu=mean(suspension_coil_data$PSI)) #compare Lot3 sample versus population mean

	One Sample t-test

data:  psi_lot3_sample$PSI
t = -1.2052, df = 24, p-value = 0.2399
alternative hypothesis: true mean is not equal to 1498.78
95 percent confidence interval:
 1489.178 1501.302
sample estimates:
mean of x 
  1495.24 
