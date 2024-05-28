# Making figures with ggplot2 part II: More geoms and different types of graphs

### In this section we will go over more geoms and learn how to plot different 
### types of graphs using ggplot2.

### For our example data, we will be using the same assembly QC table from the 
### previous section:

df <- read.delim("./quast_data.tsv", 
                 header = T, 
                 stringsAsFactors = F, 
                 check.names = F)

## A. Histograms

### To plot a histogram, we use the geom geom_histogram().
### We will start by plotting a histogram of N50:

ggplot(df, aes(x=N50)) + 
      geom_histogram()

### Notice that R prints the message:
### "`stat_bin()` using `bins = 30`. Pick better value with `binwidth`."

### Additionally, our histogram is spread thin.
### We can change the amount of bins using the bin argument:

ggplot(df, aes(x=N50)) + 
      geom_histogram(bins = 10)

### We can change the color of our histogram using what we learned about aes()
### in the previous section:

ggplot(df, aes(x=N50)) + 
      geom_histogram(bins=10, color="black", fill="lightgreen")

### We can color our histogram by a specific variable using aes() and color or fill 
### For example, coloring our N50 histogram by Species.

ggplot(df, aes(x=N50, fill=Species)) +
      geom_histogram(bins=10)

### We can change the position of the histogram's bars using the argument position
### Values for the argument position are “identity”, “stack”, and “dodge”:

ggplot(df, aes(x=N50, fill=Species)) +
  geom_histogram(bins=10, position="identity")

### ggplot also has the ability to add a line at the mean or median of our 
### histogram with geom_vline():
  
ggplot(df, aes(x=`Largest contig`)) +
  geom_histogram(bins=10) +
  geom_vline(aes(xintercept=median(`Largest contig`)), linetype="dashed", size=1)

## B. Barplots

### To plot a barplot, we use the geom geom_bar().
### We will start by plotting the counts for each Species in the data set:

ggplot(df, aes(x=Species)) + 
  geom_bar(stat="count")

### Note: "count" is what we use to tell ggplot we want to graph counts of a 
### particular variable.

### coord_flip() can be used to plot the bars horizontally instead of vertically:

ggplot(df, aes(x=Species)) + 
  geom_bar(stat="count") +    
  coord_flip()

### color, fill, and aes() can be used to color and fill the bars:

ggplot(df, aes(x=Species, color=Species, fill=Species)) +
  geom_bar(stat="count")

ggplot(df, aes(x=Species, fill=Species)) +
  geom_bar(stat="count", color="black")

### Multiple variables can be used in the barplot. For example, plotting the
### the AMR counts and coloring the bars by species

ggplot(df, aes(x=AMR, fill=Species, color=Species)) + 
  geom_bar(stat="count")

## C. Box Plots

### To plot a box plot, we use the geom geom_boxplot().
### We will start by plotting a basic box plot of Species vs Total length

ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot()

### Outliers in our data can sometimes make it difficult to see box plots as is,
### but we can remove them using the outliers parameter:

ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot(outliers=F)

### There are also options for changing the appearance of outliers.
### Those options include outlier.color, outlier.shape, outlier.size, etc:

ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot(outlier.color="blue", outlier.shape=15, outlier.size=3)

?geom_boxplot

### We can use coord_flip() to horizontally plot the the boxes:

ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot(outliers=F) + 
  coord_flip() 

### Like geom_vline(), geom_hline() can be used to plot a horizontal line:

ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot(outliers=F) + 
  geom_hline(aes(yintercept=mean(`Total length`)), linetype="dashed")

### Coloring our box plot by Species is the same as in previous examples:

ggplot(df, aes(x=Species, y=`Total length`, fill=Species)) + 
  geom_boxplot(color="black")

ggplot(df, aes(x=Species, y=`Total length`, color=Species)) + 
  geom_boxplot()
