library(tidyverse)

# Linear regression for MPG

# Import/read csv
mecha_data <- read.csv("MechaCar_mpg.csv",stringsAsFactors = F,check.names = F)

# Linear regression module 
mecha_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_data)

# P-value and r-squared of linear regression
summary(mecha_lm)

# Trip analysis

# Read csv
suspension_data <- read.csv("Suspension_Coil.csv",stringsAsFactors = F, check.names = F)

# Total summary DF
total_summary <- suspension_data %>% 
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

# Lot summary
lot_summary <- suspension_data %>% group_by(Manufacturing_Lot) %>% 
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups='keep')

# Suspension coil t-tests

# T-test for all Lots
t.test(suspension_data$PSI,mu = 1500)

# T-test Lot 1
t.test(subset(suspension_data,Manufacturing_Lot=="Lot1")$PSI,mu = 1500)

# T-test Lot 2
t.test(subset(suspension_data,Manufacturing_Lot=="Lot2")$PSI,mu = 1500)

# T-test Lot 3
t.test(subset(suspension_data,Manufacturing_Lot=="Lot3")$PSI,mu = 1500)
