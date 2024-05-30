# Introduction to R part III: Vectors

### Vectors are a type of data structure.
### They contain a set of values in a specific order.
### These values can be any of the data types we discussed in Part II.

### This vector contains numerics:

c(1,2,3)

### While this vector contains characters:

c("A", "B", "C")

### Vectors can include a mix of data types.
### R will store the values in the vector below as strings:

c("A", 1, 4L)

### Vectors can also contain repeats of the same value:

c("A", "A", "B", "C")

### Note: c() is a function that combines values into a vector. The c *must* be
### lowercase.

### The length of a vector corresponds to the number of values in it.
### This vector has a length of 3:

c(1,2,3)

### We can use the length() function to get the length of a vector.
### Using this function confirms this vector has a length = 3:

length(c(1,2,3))

### Like the data types we discussed in Part II, vectors can be assigned to variables:

my.vector <- c(1, 2, 3)

### We can also perform mathematical functions on vectors.
### This equation will add 2 to every value in my.vector:

2 + my.vector

### While this equation will raise 2 to the nth power for very value in the vector:

2**my.vector

# add part for multiplying vectors of equal or not equal length

### Each value in a vector has an index that can be used to reference it.
### Indices are represented by numbers.
### The 1st value in a vector is index 1, the 2nd is index 2, etc.
### Values in a vector can be retrieved using []:

my.vector <- c("A", "B", "C")

my.vector[1]

my.vector[2]

my.vector[3]

### A colon (:) can be used to retrieve values between two indices:

my.vector[1:2]

### A vector of numbers can also be used to retrieve the values at those indices:

my.vector[c(1,2)]

### The values in a vector can be sorted using sort().
### If given numerics, R will sort them in numerical order:

unsorted.vector <- c(1, 3, 2, 4)
sorted.vector <- sort(unsorted.vector)
sorted.vector

### If given letters, R will sort in alphabetical order based on the first letter
### in each value in the vector:

unsorted.vector <- c("cat", "B", "aardvark", "D")
sorted.vector <- sort(unsorted.vector)
sorted.vector

### If given letters AND numbers, R will sort the numbers first, then the letters:

unsorted.vector <- c("1", "400", "4", "100", "A", "C", "B")
sorted.vector <- sort(unsorted.vector)
sorted.vector

### Note: Even though 4 is less than 100, 100 comes before 4 in this sorted vector,
### because the numbers in this vector are classified as characters.

### Vectors can be sorted in reverse order by adding the 'decreasing'
### argument.
### By default, vectors are sorted in increasing order:

unsorted.vector <- c(1, 3, 2, 4)
sorted.vector <- sort(unsorted.vector, decreasing = T)
sorted.vector

### Two vectors can be joined by making a vector of vectors:

vector.A <- c("A","B","C")
vector.B <- c("D","E","F")
vector.X <- c(vector.A,vector.B)
vector.X

### Here are several useful functions for dealing with vectors:

my.vector <- c(1,1,2,3,3,3,4,5)

### min() gives us the smallest value of a vector:

min(my.vector)

### max() gives us the largest value of a vector:

max(my.vector)

### mean() gives us the mean of a vector:

mean(my.vector)

### median() gives us the median of a vector:

median(my.vector)
