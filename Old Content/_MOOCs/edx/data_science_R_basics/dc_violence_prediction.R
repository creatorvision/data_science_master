library(dslabs)
require(dplyr)
data(murders)

west <- murders$region == "West"
# murder_rate
murder_rate <- murders$total*100000/murders$population
# Average murder_rate in US
mean(muders_rate)
safe <- murder_rate <=1 
index <- west & safe
murders$state[index]

index <- which(murder_rate <=1)
murders$state[index]

index <- match(c("New York","Florida","Texas"),murders$state)
murders$state[index]
murder_rate[index]

x <- c("a","b","c","d")
y <- c("a","b","f")

y %in% x

population_in_millions <- murders$population/10^6
total_gun_murders <- murders$total
plot(population_in_millions,total_gun_murders)
hist(murder_rate)
murders$state[which.max(murder_rate)]
murders <-  murders %>% mutate(rate=total*1000000/population, rank=rank(-rate))
boxplot(rate ~ region, data = murders)
m <- 25
s <-  vector(length =m)
s_n <-  function(m){
  sum(1:m)
}
for(i in 1:m){
    s[i] <- s_n(i)
}
n <- 1:m
plot(n,s)
lines(n,n*(n+1)/2)
