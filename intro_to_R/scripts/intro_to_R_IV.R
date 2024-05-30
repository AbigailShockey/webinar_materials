# Introduction to R part IV: Data Frames

### Data frames are a list of *equal-length* vectors that represent a table of data
### with rows and columns.
### Each column is a vector, and the number of rows is equal to the vector length.
### Equal length vectors can be assigned to a data frame using the data.frame() 
### function:

vectorA <- c(1,2,3)
vectorB <- c(4,5,6)
df <- data.frame(A=vectorA,B=vectorB)

### By default, the rows of a data  frame are assigned a number from 1 to n.
### The $ symbol can be used to reference a specific column in the data frame:

df$A

### We can overwrite any column in the data frame.
### In this case, we are storing values in the data frame, not a new variable:

df$A <- c(7,8,9)
df$A
df$A <- df$A * 2
df$A

### Remember: The new column must be the same length as the original.

### R has several built-in data sets for use.
### We'll be using the Iris data set for the rest of the tutorial:

df <- iris

### We can use the functions nrow() and ncol() to get the number of rows and 
### columns in Iris, respectively:

nrow(df)
ncol(df)

### We can use the head() function to print the first few lines of Iris:

head(df) 

### A data frame can be written to a file by using the write.table() function:

write.table(x = df,
            file = "iris-data.tsv",
            row.names = FALSE,
            sep="\t")

### Note: Always remember to use unique file names if you're working in the same
### directory, because R will overwrite any existing file of the same name.

### A data frame is written to your working directory by default.
### You can use getwd() to determine your curent working directory:

getwd()

### A table can be read from a file and stored as a data frame using the 
### read.table() function:

new.df <- read.delim("iris-data.csv",
                     header = TRUE, sep = "\t")

### A data frame is read from your working directory by default.

### Using the head() command we see that the df and new.df data frames are the same:

head(new.df)

### We can use the summary() function to summarize each column:

summary(df)
