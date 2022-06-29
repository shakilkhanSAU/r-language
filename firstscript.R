19+23

5-4

# a multiplication
3*4

# a division
(5+5)/3

#modulo
28%%6

#assign the value 42 to x 
x <- 42

# print out the value of the variable x
x

# assign the value 5 to the variable my_apple
my_apples <-5

#print out the variable my_apple 
my_apples

# assign the value to the variabels my_apples 
my_apples <-5
my_orange <-5
myHouse <-5

#add those two variable 
my_apples + myHouse

# create the variable myFriut
myFruits <- my_apples + myHouse 
myFruits < "twelve" 

#fix the asignment of myOranges 
myOranges <- "this is six"

#create the variable myFruit and pirnt is out 
myFruit <- "this is a fruit"
myFruit

#create a logical value with bulean false and true
logic <- FALSE
illigal <- TRUE

# create a null variable
nullData <- NULL
nullData

# check the variable type ----
class(myFriut)
class(nullData)
class(illigal)
class(myHouse)



# create the vector
vec1 <- c(1,3,4)
vec2 <- c(2,4,5)

#take sum of a vector and bvector 
sumVect <- vec1 + vec2

#print 
sumVect

#In R, it is possible to slice a vector. In some occasion, we are interested in only the first five
#rows of a vector. We can use the [1:5] command to extract the value 1 to 5.


# Slice the first five rows of the vector
slice_vector <- c(1,2,3,4,5,6,7,8,9,10)
slice_vector[1:5]

# create a vector between 1 to 10
vectorCreate <- c(1:10)
vectorCreate

# 5 er beshi value dekhay { show the value above 5}
vectorCreate[(vectorCreate > 5)]


# Print 5 and 6
logical_vector <- c(1:10)
logical_vector[(logical_vector > 4) & (logical_vector < 7)]

vectr <- c(1:100)
vec <- vectr[(vectr >49) & (vectr <71)]
vec


education <-
  read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/robustbase/education.csv",
           stringsAsFactors = FALSE)

education


# to see the type of different column / data frame 
str(education)


#to change column name
colnames(education) <- c("X", "State", "Region", "urbarnPopulation", "Per.Capital.Income", 
                         "Minor.Population", "Education.Expenditures")
education

ed_exp1 <- education[c(10:21),c(2,6:7)]
ed_exp1


# alternative way to make a subset
ed_exp2 <- education[-c(1:9,22:50),-c(1,3:5)]
ed_exp2

ed_exp3 <- education[which(education$Region == 2),names(education) %in%
                          c("state","Minor.Population","Education.Expenditures")]
ed_exp3


ed_exp4 <- education[which(education$state == "VT"),names(education) %in%
                       c("state","Minor.Population","Education.Expenditures")]
ed_exp4


ed_exp5 <- education[which(education$state == "ME"),c(1,3,4)]
ed_exp5


#subset of a data set
subSet <- subset(education, Region==2, select=c("State", "Minor.Population", "Education.Expenditures"))
subSet


# select function use kore subset make kora
ed_exp5 <- select(filter(education, Region ==
                              2),c(State:Education.Expenditures))
ed_exp5


# aim of research design is to know unknown fact in a systematic way.
# analysis is important for comparing some fact and get desire things 
# finding some fact according to some conditions {finding the best outcomes}
# research design is done for minimizing the error of the outcomes


