# to look at data set
str(Plant_data)


# to change the type of data

# convert to factor
Plant_data$Combination<-factor(Plant_data$Combination)
str(Plant_data)

Plant_data$Plant_Height <-factor(Plant_data$Plant_Height)
str(Plant_data)

# convert to numeric
Plant_data$Plant_Height <-as.numeric(Plant_data$Plant_Height)
str(Plant_data)

# convert to character
Plant_data$Combination <-as.character(Plant_data$Combination)
str(Plant_data)

# to add a new column in data set
Plant_data$sl<-paste(1:16)
str(Plant_data)

# sl number of data set (converting to the numeric) this is optional

# to plot data set
plot(Plant_Height~sl,data = Plant_data)

plot(Leaf_No.~sl, data=Plant_data)

plot(Leaf_length~sl, data=Plant_data)



# there are three assumption in anova analysis
# 1. independent of the observation
# 2. normal distribution of the observation (residuals) and there n=30 must
# 3. equality (homogeneity) of variance
# Normality check of the data set

# data normally distributed kina dekahar jonno kichu test kora lage, jemon: shapiro.test(data) (if p-value >0.05 then it willbe normally distributed)
shapiro.test(Plant_data$Plant_Height)
shapiro.test(Plant_data$Leaf_No.)
shapiro.test(Plant_data$Leaf_length)

# creating dot chart
dotchart(sort(Plant_data$Plant_Height))
dotchart(sort(Plant_data$Leaf_No.))
dotchart(sort(Plant_data$Leaf_length))

# creating histogram of specific data column
hist(Plant_data$Plant_Height)
hist(Plant_data$Leaf_length)
hist(Plant_data$Leaf_No.)

# qqnorm functin
qqnorm(Plant_data$Plant_Height)
qqline(Plant_data$Plant_Height)


# one more way to do that
library("car")
qqPlot(Plant_data$Plant_Height)


# are we happy with the noramlity? subset kore tarpor dekha je 
shapiro.test(Plant_data[Plant_data$Replication=="R1",]$Plant_Height)

# if yes, lets do the anova
# without considering interaction among the variable: (anova test er diff package ache)
model <- aov(Plant_Height~Treatment+Replication+Lime, data= Plant_data) #plant height er opure treatment r replication er alada effect effect ache kina
summary(model)
shapiro.test(residuals(model))
hist(residuals(model))

# without considering interaction among the variable (eksathe effect dekhar jonno)
# Treatment*Replication (T*R) er eksathe effect dekhar jonno

model1 <- aov(Plant_Height~Treatment*Lime+Replication, data = Plant_data)
summary(model1)


# mean separation

#LSD test
library(agricolae)

letter <- LSD.test(model1, "Treatment", 0.05)
letter

letter1 <- LSD.test(model1, "Replication", 0.05)
letter1


letter2 <- LSD.test(model2, "LimeTrt", 0.05)
letter2

letter3 <-LSD.test(model2, "Lime", 0.05)
letter3

# 
model2 <- aov(Plant_Height~Treatment+Lime+Treatment+LimeTrt+Replication+Lime, data= Plant_data)
summary(model2)
summary(model1)


# 
inter=with(Plant_data,LSD.test(Plant_Height,Lime:Treatment, DFerror = 21, MSerror = 43))
inter


#DMRT test (for lettering duncan multiple ..... test)
fact1 <- duncan.test(model2, "Lime")
fact1

fact2 <- duncan.test(model2, "Treatment")
fact2

fact3 <- duncan.test(model2, "Replication")
fact3

fact4 <- duncan.test(model2, 'LimeTrt')
fact4


#tukeyHSD another way to check the difference among the mean
TukeyHSD(model2)


