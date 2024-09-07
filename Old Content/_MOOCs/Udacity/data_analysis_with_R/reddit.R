reddit <- read.csv('reddit.csv')

table(reddit$employment.status)
summary(reddit)
str(reddit)
levels(reddit$age.range)

library(ggplot2)
qplot(data = reddit , x=age.range)
reddit$age.range<- ordered(reddit$age.range , levels= c("Under 18", "18-24", 
                                               "25-34", "35-44", "45-54",
                                               "55-64", "65 or Above"))
reddit$age.range<- factor(reddit$age.range , levels= c("Under 18", "18-24", 
                                                        "25-34", "35-44", "45-54",
                                                        "55-64", "65 or Above"), ordered = T)
str(reddit)
qplot(data = reddit , x=age.range)
