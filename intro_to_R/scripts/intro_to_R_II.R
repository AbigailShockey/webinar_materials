# Introduction to R part II: Variables

### Variables are symbolic names used to store information (just like in algebra!).
### Storing a value in a variable allows us to reference it later.

### The <- symbol is used to assign variables in R:

x <- 2
x + 2

### The result of this equation is 4

### The = sign can also be used to assign variables, but it is considered best 
### practice to use <- :

x = 2
x + 2

### The result of this equation is also 4

### Note: when you store a new value in a variable, the old value will be
### overwritten.

### There are rules for naming variables.
### Variable names can include letters, numbers, underscores and periods.
### The following are all valid variable names:

myvariable <- 1

my_variable <- 2

my.varaible <- 3

my_variable_2 <- 4

### Variable names cannot include: spaces, dashes or symbols.
### Variable names cannot start with a number or underscore.
### Using these in variable names would cause an error.

### In the examples above, all the variables were assigned numbers,
### but there are other types of data we can assign to variables.

### We are going to review four data types you can store in a variable.

### 1. Character: Characters A-Z and punctuation characters such as ? contained 
### between single or double quotes:

x <- "I like dogs"

### 2. Numeric: Real numbers with or without decimals:

x <- 2

### 3. Integer: Real numbers without decimals; the L character tells R to store 
### the number as an integer:

x <- 2L

### 4. Logical: TRUE/FALSE?:

x <- TRUE

### We can use the class() function to determine what type of data a variable
### contains:

x <- "I like dogs"
class(x)

### Side Note: Functions are blocks of code that perform a specific task, 
### which have been given a name.In this case the function is to determine what 
### the data's class is, and it has been given the name class.

### Information on any given function can be found by placing a ? before the 
### function:

?class()

### Information can also be found using the Help tab.
### R has many other useful built-in functions, which we will discuss in later
### sections.

### The result of an equation can be stored in a variable:

x <- 1
y <- x + 1
y

### The result of this equation is also 2.
