# Making figures with ggplot2 part III: Axes and titles

### We've discussed a few of the different ways to customize your figures using
### ggplot2. In this section, we will review even more ways to customize your 
### figures, including themes, colors, axes, legends, and more

### For our example data, we will be using the same assembly QC table from the 
### previous section

df <- read.delim("./quast_data.tsv", 
                 header = T, 
                 stringsAsFactors = F, 
                 check.names = F)

## A. Axes and titles

### You may have noticed that ggplot2 labels the x and y axis using their
### respective column names. Additionally, the plot has no title

ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot(outliers=F)

### We can change those defaults using the xlab() and ylab() functions

ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot(outliers=F) +
  xlab("Assembly Species") +
  ylab("Assembly Length (bp)")

### Alternatively, we can use the labs() function

ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot(outliers=F) +
  labs(x="Assembly Species",
       y="Assembly Length (bp)",
       title="Species Assembly Lengths")

### ggplot2 also automatically chooses the limit, scale, and labels of an axis,
### but we can change those defaults as well

### The xlim() and ylim() functions can be used to change the limit of an axis

### 1119861 is the highest x value and 12380070 is the highest y value of our 
### line graph, so we'll choose values close to those as our x and y max.
### Our x and y min will be 0

ggplot(df, aes(x=`Largest contig`, y=`Total length`)) + 
  geom_line()

ggplot(df, aes(x=`Largest contig`, y=`Total length`)) + 
  geom_line() + 
  xlim(0,1120000) +
  ylim(0,12400000)

### To change the scale of an x, we can use scale_x and scale_y functions, which
### there are many to choose from

help.search("scale_x", package = "ggplot2")

### The functions for discrete variables include the word "discrete" and the 
### functions for  continuous variables include the word "continuous"

### The limits, breaks, labels, and names of each axis can be set with those arguments

ggplot(df, aes(x=`Largest contig`, y=`Total length`)) + 
  geom_line() +
  scale_x_continuous(limits=c(280000,1120000),
                     breaks=c(280000,560000,840000,1120000),
                     labels=c(280000,560000,840000,1120000),
                     name="Largest Contig (bp)") +
  scale_y_continuous(limits=c(3100000,12400000),
                     breaks=c(3100000,6200000,9300000,12400000),
                     labels=c(3100000,6200000,9300000,12400000),
                     name="Assembly Length (bp)") 

### Instead of manually typing out the axis scale, we can use the seq.int() 
### function to create it and store it in a variable

xmin <- 280000
xmax <- 1120000
x_scale <- seq.int(280000, 1120000, by = (xmax/4))

ymin <- 3100000
ymax <- 12400000
y_scale <- seq.int(3100000, 12400000, by = (ymax/4)) 

ggplot(df, aes(x=`Largest contig`, y=`Total length`)) + 
  geom_line() +
  scale_x_continuous(limits=c(xmin,xmax),
                     breaks=x_scale,
                     labels=x_scale,
                     name="Largest Contig (bp)") +
  scale_y_continuous(limits=c(ymin,ymax),
                     breaks=y_scale,
                     labels=y_scale,
                     name="Assembly Length (bp)") 

### There are many other functions we can use to transform our continous axes
### For example, we can reverse our axes

ggplot(df, aes(x=`Largest contig`, y=`Total length`)) + 
  geom_line() +
  scale_x_reverse() +
  scale_y_reverse() 

### Or we can log transform them

ggplot(df, aes(x=`Largest contig`, y=`Total length`)) + 
  geom_line() +
  scale_x_log10() +
  scale_y_log10() 

### We can also log transfom axes using the scale_x/y_continuous trans parameter 

ggplot(df, aes(x=`Largest contig`, y=`Total length`)) + 
  geom_line() +
  scale_x_continuous(trans="log10") +
  scale_y_continuous(trans="log10")

### As a reminder, you can view the other axis scale functions using the help function

help.search("scale_x", package = "ggplot2")

### Scaling discrete axes is slightly different, but uses the same arguments

ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot(outliers=F) 

### To change the name of the axis, tick marks, and order:

ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot(outliers=F) +
  scale_x_discrete(breaks=c("Acinetobacter baumannii","Klebsiella pneumoniae"),
                   limits=c("Klebsiella pneumoniae","Acinetobacter baumannii"),
                   labels=c("A. baumannii","K. pneumoniae"),
                   name="Assembly Species")

### To choose which variables to display:

ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot(outliers=F) +
  scale_x_discrete(limits=c("Acinetobacter baumannii"),
                   labels=c("A. baumannii"),
                   name="Assembly Species")
