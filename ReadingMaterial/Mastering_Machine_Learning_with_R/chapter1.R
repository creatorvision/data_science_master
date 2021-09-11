data("anscombe")
attach(anscombe)
anscombe

cor(x1,y1)
cor(x2,y1)
par(mfrow=c(2,2))
plot(x1,y1, main="Plot 1")
plot(x2,y2, main="Plot 2")
plot(x3,y3, main="Plot 3")
plot(x4,y4, main="Plot 4")

install.packages("alr3")
require("alr3")
data("snake")
dim(snake)
head(snake)
names(snake) <- c("content","yeild")
attach(snake)
plot(content,yeild,xlab="Water content of snow", ylab=" Water Yeild")
yeild.fit <- lm(yeild ~ content)
summary(yeild.fit)

