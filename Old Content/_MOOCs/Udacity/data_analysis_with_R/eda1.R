#Shivang Gupta
#DS 2018

setwd(getwd())
statesInfo <-read.csv('stateData.csv')
statesSubset <- subset(statesInfo, state.region ==1)
statesSubsetBracket <- statesInfo[statesInfo$state.region ==1,]
