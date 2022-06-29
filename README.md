# r-language
Playing with R: Try to Run the following codes by yourself

Different sign use in R
●	Addition: +
●	Subtraction: -
●	Multiplication: *
●	Division: /
●	Exponentiation: ^
●	Modulo: %%
The last two might need some explaining:
●	The ^ operator raises the number to its left to the power of the number to its right: for example, 3^2 is 9.
●	The modulo returns the remainder of the division of the number to the left by the number on its right, for example 5 modulo 3 or 5 %% 3 is 2.
# An addition
5 + 5 

# A subtraction
5 - 5 

# A multiplication
3 * 5

 # A division
(5 + 5) / 2 

# Exponentiation
3^2
2^5

# Modulo
28%%6

# Assign the value 42 to x
x <- 42

# Print out the value of the variable x
x

# Assign the value 5 to the variable my_apples
my_apples<-5

# Print out the value of the variable my_apples
my_apples

# Assign a value to the variables my_apples and my_oranges
my_apples <- 5
my_oranges<-8
# Add these two variables together
my_apples+my_oranges

# Create the variable my_fruit
my_fruit<-my_apples+my_oranges

# Assign a value to the variable my_apples
my_apples <- 5 

# Fix the assignment of my_oranges
my_oranges <- "six" 

# Create the variable my_fruit and print it out
my_fruit <- my_apples + my_oranges 
my_fruit

# Change my_numeric to be 42
my_numeric <- 42

# Change my_character to be "universe"
my_character <- "universe"

# Change my_logical to be FALSE
my_logical <- FALSE

# Declare variables of different types
my_numeric <- 42
my_character <- "universe"
my_logical <- FALSE 

# Check class of my_numeric
class(my_numeric)

# Check class of my_character
class(my_character)

# Check class of my_logical
class(my_logical)

Create the vectors
vect_1 <- c(1, 3, 5)
vect_2 <- c(2, 4, 6)
# Take the sum of A_vector and B_vector
sum_vect <- vect_1 + vect_2
# Print out total_vector
sum_vect
Output:
[1]  3  7 11
In R, it is possible to slice a vector. In some occasion, we are interested in only the first five rows of a vector. We can use the [1:5] command to extract the value 1 to 5.
# Slice the first five rows of the vector
slice_vector <- c(1,2,3,4,5,6,7,8,9,10)
slice_vector[1:5]

Output:
## [1] 1 2 3 4 5
The shortest way to create a range of value is to use the: between two numbers. For instance, from the above example, we can write c(1:10) to create a vector of value from one to ten.
# Faster way to create adjacent values
c(1:10)
Output:
## [1]  1  2  3  4  5  6  7  8  9 10

#Create a vector from 1 to 10
logical_vector <- c(1:10)
logical_vector>5

#Print value strictly above 5
logical_vector[(logical_vector>5)]
# Print 5 and 6
logical_vector <- c(1:10)
logical_vector[(logical_vector>4) & (logical_vector<7)]


Source:
http://r-eco-evo.blogspot.com/2011/08/comparing-two-regression-slopes-by.html

 
Sub-setting a dataset

#import education expenditure data set and assign column names
education <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/robustbase/education.csv", stringsAsFactors = FALSE)
colnames(education) <- c("X","State","Region","Urban.Population","Per.Capita.Income","Minor.Population","Education.Expenditures")
View(education)
Now, let’s suppose we oversee the Midwestern division of schools and that we are charged with calculating how much money was spent per child for each state in our region. We would need three variables: State, Minor.Population, and Education.Expenditures. However, we would only need the observations from the rows that correspond to Region 2. Here’s the basic way to retrieve that data in R:
	ed_exp1 <- education[c(10:21),c(2,6:7)]
To create the new data frame ‘ed_exp1,’ we subsetted the ‘education’ data frame by extracting rows 10-21, and columns 2, 6, and 7. Pretty simple, right?
Another way to subset the data frame with brackets is by omitting row and column references. Take a look at this code:
	ed_exp2 <- education[-c(1:9,22:50),-c(1,3:5)]
Here, instead of subsetting the rows and columns we wanted returned, we subsetted the rows and columns we did not want returned and then omitted them with the “-” sign. If we now call ed_exp1 and ed_exp2, we can see that both data frames return the same subset of the original education data frame.
Now, these basic ways of subsetting a data frame in R can become tedious with large data sets. You have to know the exact column and row references you want to extract. It’s pretty easy with 7 columns and 50 rows, but what if you have 70 columns and 5,000 rows? How do you find which columns and rows you need in that case? Here’s another way to subset a data frame in R…
	ed_exp3 <- education[which(education$Region == 2),names(education) %in% c("State","Minor.Population","Education.Expenditures")]
Now, we have a few things going on here. First, we are using the same basic bracketing technique to subset the education data frame as we did with the first two examples. This time, however, we are extracting the rows we need by using the which() function. This function returns the indices where the Region column of the education data from is 2. That gives us the rows we need. We retrieve the columns of the subset by using the %in% operator on the names of the education data frame.
Now, you may look at this line of code and think that it’s too complicated. There’s got to be an easier way to do that. Well, you would be right. There is another basic function in R that allows us to subset a data frame without knowing the row and column references. The name? You guessed it: subset().
ed_exp4 <- subset(education, Region == 2, select = c("State","Minor.Population","Education.Expenditures"))
The subset() function takes 3 arguments: the data frame you want subsetted, the rows corresponding to the condition by which you want it subsetted, and the columns you want returned. In our case, we take a subset of education where “Region” is equal to 2 and then we select the “State,” “Minor.Population,” and “Education.Expenditure” columns.
When we subset the education data frame with either of the two aforementioned methods, we get the same result as we did with the first two methods:
Now, there’s just one more method to share with you. This last method, once you’ve learned it well, will probably be the most useful for you in manipulating data. Let’s take a look at the code and then we’ll go over it…
install.packages("dplyr")
library(dplyr)
ed_exp5 <- select(filter(education, Region == 2),c(State,Minor.Population:Education.Expenditures))

So, once we’ve downloaded dplyr, we create a new data frame by using two different functions from this package:
●	filter: the first argument is the data frame; the second argument is the condition by which we want it subsetted. The result is the entire data frame with only the rows we wanted.
●	select: the first argument is the data frame; the second argument is the names of the columns we want selected from it. We don’t have to use the names() function, and we don’t even have to use quotation marks. We simply list the column names as objects.
In this example, we’ve wrapped the filter function in the selection function to return our data frame. In other words, we’ve first taken the rows where the Region is 2 as a subset. Then, we took the columns we wanted from only those rows. The result gives us a data frame consisting of the data we need for our 12 states of interest:
 
So, to recap, here are 5 ways we can subset a data frame in R:
1.	Subset using brackets by extracting the rows and columns we want
2.	Subset using brackets by omitting the rows and columns we don’t want
3.	Subset using brackets in combination with the which() function and the %in% operator
4.	Subset using the subset() function
5.	Subset using the filter() and select() functions from the dplyr package
That’s it! Happy subsetting!
Source: https://www.r-bloggers.com/5-ways-to-subset-a-data-frame-in-r/

