####
## Name : Shivang Gupta
## Case Study : Optimize the Products Price for an Online Vendor
## Link : https://www.analyticsvidhya.com/blog/2016/07/solving-case-study-optimize-products-price-online-vendor-level-hard/
####
require(dplyr)
setwd("/Users/sgupta/Desktop/code/data_science/Case Studies/Optimize the Products Price for an Online Vendor/")
base_data <- read.csv(file="Vendor_Data.csv", header=TRUE, sep=",")

plot(x= base_data$Products, y= base_data$Cost_per_unit, col="red",type="p" )
plot(x= base_data$Products, y= base_data$Avg_Price_per_unit, col="red", type="p")
plot(x= base_data$Products, y= base_data$Average_Profit_per_unit, col="red", type="p")
plot(x= base_data$Products, y= base_data$Average_units_sold, col="red", type="p")

# Expected profit v/s avg_profit
plot(x=(base_data$Avg_Price_per_unit-base_data$Cost_per_unit), y=base_data$Average_Profit_per_unit, type="p")
# Overall Expected profit v/s avg_profit
plot(x=(base_data$Avg_Price_per_unit-base_data$Cost_per_unit)*base_data$Average_units_sold, y=base_data$Average_Profit_per_unit*base_data$Average_units_sold, type="p")

# Current overall profit 
base_data <-  base_data %>% mutate(avg_overall_profit= Average_Profit_per_unit*Average_units_sold,
                                   avg_possible_overall_profit = Average_Profit_per_unit*Average_units_sold *0.05 )

# Using the given incremental acquisition and incermental sales volume 

get_profit <- function(sfactor,factor,base_data){
  profit= (base_data$Avg_Price_per_unit*sfactor - base_data$Cost_per_unit)*
    (base_data$Average_units_sold*(1+(base_data$Increase_sale_volume*factor)))*
    ((1+base_data$Incremental_acquisition*factor)*0.05)
  return(profit)
}
optimal_pr <- c(0)
#default avg price set as the optimal prize
base_data <- base_data %>% mutate(optimal_profit=Average_Profit_per_unit)

for (i in 1:nrow(base_data)) {
  optimal_pr <- c(0)
  for (j in seq(0.9,1.2,0.0001)) {
        f <- ifelse(j<1,j,1-j)
        optimal_pr <- append(optimal_pr,get_profit(j,f,base_data[i,]))
    }
    base_data[i,]$optimal_profit= max(optimal_pr)
    optimal_pr <- c(0)
}
