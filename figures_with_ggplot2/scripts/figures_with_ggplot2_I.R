# Making figures with ggplot2 part I: ggplot2 basics

# By Abigail Shockey

## A. What is ggplot2?

### https://ggplot2.tidyverse.org/

### "ggplot2 is a system for declaratively creating graphics, 
### based on The Grammar of Graphics."

### The "grammar of graphics" is a system for describing the
### individual components that make up the figure or graphic we are visualizing.

### ggplot2 allows you to build a plot layer by layer.

### In this section, we will go over the geom and aes layers.
### We will review layers that allow for further customization in later sections.

### For our example data, we will be using a table from the output of the
### genome assembly QC program QUAST.

### First we will read in our table, store it as a variable, and view it:

df <- read.delim("./data/quast_data.tsv", 
                 header = T, 
                 check.names = F,
                 stringsAsFactors = F,
                 sep = "\t")

View(df)

### ggplot() is the function for creating a new plot using ggplot2.
### As a reminder, we can use library() to load the package and ? to view its 
### documentation in the Help tab:

library(ggplot2)
?ggplot2

### Notice that using the ggplot() without a geom or aes results in a blank plot:

ggplot(df)

## B. Geometric objects aka geoms

### geoms specify what type of graph we are plotting e.g. line, bar, scatter, etc.

### You can use the help function to search for the different types of geoms
### available in ggplot2, or you can using the search bar in the help tab:

help.search("geom_", package = "ggplot2")

## C. Aesthetic apping aka aes()

### We use aes() to map variables to visual properties such as position (x, y), 
### color, shape, and size.

### Remember: aes() is a layer we add to our plot with our geom layer
### We do this by placing aes() within the ggplot function.

### For example, plotting Largest Contig vs Total Length without a geom layer
### gives us an x- and y-axis, but no data on the graph:

ggplot(df, aes(x=`Largest contig`, y=`Total length`))

### We gave ggplot() the table and position of the data, but no geom.

### Adding geom_point() to our graph of Largest Contig vs Total Length will 
### plot a scatter plot of those data:

ggplot(df, aes(x=`Largest contig`, y=`Total length`)) + 
  geom_point()

### To plot those data as a line, we use geom_line():

ggplot(df, aes(x=`Largest contig`, y=`Total length`)) + 
  geom_line()

### And if we wanted to include dots and lines, we use both geom functions:

ggplot(df, aes(x=`Largest contig`, y=`Total length`)) + 
  geom_line() + 
  geom_point()

### We can change the appearance, or aesthetic, of our plot by adding more
### parameters to aes().

### The properties we can change using aes() include things like:
### shape
### size
### color (outside color)
### fill (inside color)
### line type

### If we want to make a uniform change, we make that change outside of aes().
### For example, to change the color, size and shape of the points in our plot:

ggplot(df, aes(x=`Largest contig`, y=`Total length`)) + 
  geom_point(size=3, shape=17, color="blue")

### We can do the same for our line plot and change its color and linetype:

ggplot(df, aes(x=`Largest contig`, y=`Total length`)) + 
  geom_point(size=3, shape=17, color="blue") +
  geom_line(size=2, linetype="dashed", color="purple")

### Note: the numbers associated with point shapes and line types can be viewed
### with the following ggpubr commands:

library(ggpubr)
show_point_shapes()
show_line_types()

### If we want to map an aesthetic change to a variable, we make that change 
### inside of aes().
### For example, to change the shape and color of the points in our 
### scatter plot based on AMR profile:

View(df)

ggplot(df, aes(x=`Largest contig`, y=`Total length`)) + 
  geom_point(aes(shape=AMR))

ggplot(df, aes(x=`Largest contig`, y=`Total length`)) + 
  geom_point(aes(color=AMR))

ggplot(df, aes(x=`Largest contig`, y=`Total length`)) + 
  geom_point(aes(color=AMR, shape=Species))

### We will discuss how to customize these figures further in a later section.
