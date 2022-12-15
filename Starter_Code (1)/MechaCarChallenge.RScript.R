#Part 1
#Import and read the MechaCar_mpg.csv file
mechacar_mpg <- read.csv('MechaCar_mpg.csv',stringsAsFactors = F)
head(mechacar_mpg)

#Linear Regression - pass in all six variables and add the dataframe as the data parameter
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
     ground_clearance + AWD,mechacar_mpg))

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
             ground_clearance + AWD,mechacar_mpg))

#Part 2
#Import and read the Suspension_Coil.csv
suspension_coil <- read.csv('Suspension_Coil.csv',stringsAsFactors = F)

#total summary datafram
total_summary <- suspension_coil %>% 
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% 
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

#Part 3
#t-test to determine if all manufacturing lots and each lot individually are 
#statistically different from the population mean of 1500 pounds per square inch
t.test(suspension_coil$PSI,mu=1500)
t.test(subset(suspension_coil,Manufacturing_Lot=='Lot1')$PSI,mu=1500)
t.test(subset(suspension_coil,Manufacturing_Lot=='Lot2')$PSI,mu=1500)
t.test(subset(suspension_coil,Manufacturing_Lot=='Lot3')$PSI,mu=1500)


