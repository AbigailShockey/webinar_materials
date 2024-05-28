# Making figures with ggplot2 part IV: Themes and legends

### For our example data, we will be using the same assembly QC table from the 
### previous section:

df <- read.delim("./quast_data.tsv", 
                 header = T, 
                 stringsAsFactors = F, 
                 check.names = F)

## A. Built-in themes

### ggplot2 has a number of built-in themes you can choose from for your figures
### As you may have noticed, the default has a grey background and white 
### gridlines.

### You can use the help function to search for the different types of themes
### available in ggplot2, or you can using the search bar in the help tab:

help.search("theme_grey", package="ggplot2")

### We'll use the box plot from the last section to go over some of these 
### built-in themes.

### The classic dark-on-light ggplot2 theme:

ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot(outliers=F) + theme_bw()

### A theme with only black lines of various widths on white backgrounds:

ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot(outliers=F) + theme_linedraw()

### A theme similar to theme_linedraw() but with light grey lines and axes

ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot(outliers=F) + theme_light()

### The dark cousin of theme_light(), with similar line sizes but a dark 
### background:

ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot(outliers=F) + theme_dark()

### A minimalist theme with no background annotations:

ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot(outliers=F) + theme_minimal()

### A classic-looking theme, with x and y axis lines and no gridlines:

ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot(outliers=F) + theme_classic()

### A completely empty theme:

ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot(outliers=F) + theme_void()

### You can also install packages with other built-in fonts
### For example, one of my favorite themes is Dracula

library(ggDracula)

ggplot(df, aes(x=Species, y=`Total length`, fill=Species)) + 
  geom_boxplot(outliers=F) +
  theme_dracula()

### You can change basic elements of these themes using the base_size, base_family,
### base_line_size, and base_rect_size parameters

ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot(outliers=F) + theme_bw()

base_size <- 17
ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot(outliers=F) + 
  theme_bw(base_size=base_size,
           base_family="serif",
           base_line_size=base_size/22,
           base_rect_size=base_size/22)

### Note: windowsFonts() can tell you the fonts available for you to choose from
### There are other packages to increase the number of fonts to choose from e.g.
### extraFonts

windowsFonts()


## B. Manually customizing plots with theme()

### You can manually customize almost every non-data element of your plot using the
### theme() function. These elements include:

### Line elements : axis lines, grid lines, plot panel border, etc.

element_line() 

### Text elements : plot title, axis titles, tick mark labels, legend title, etc

element_text() 

### Rectangle elements : plot background, panel background, legend background, etc.

element_rect()

### These functions are used in concert with the theme() function to manually
### change the plot elements

ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot(outliers=F) +
  theme(panel.background=element_rect(fill="white",
                                        colour="purple",
                                        linewidth=1,
                                        linetype="solid"),
        panel.grid.major=element_line(linewidth=0.9,
                                        linetype="dashed",
                                        colour="blue"),
        panel.grid.minor=element_line(linewidth=0.7,
                                        linetype="dashed",
                                        colour="blue")) 

### Alternatively, to remove these elements, we can use element_blank()

ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot(outliers=F) +
  theme(panel.border=element_blank(),
        panel.grid.major=element_blank(),
        panel.grid.minor=element_blank())

### Axes can also be formatted using theme() and element_text()

ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot(outliers=F) + 
  scale_x_discrete(labels=c("A. baumannii","K. pneumoniae")) +
  labs(x="Assembly Species",
       y="Assembly Length (bp)",
       title="Species Assembly Lengths")


ggplot(df, aes(x=Species, y=`Total length`)) + 
  geom_boxplot(outliers=F) + 
  scale_x_discrete(labels=c("A. baumannii","K. pneumoniae")) +
  labs(x="Assembly Species",
       y="Assembly Length (bp)",
       title="Species Assembly Lengths") +
  theme(plot.title=element_text(hjust=0.5),
        axis.title=element_text(family="serif"),
        axis.text=element_text(angle=45),
        axis.title.x=element_text(color="blue"),
        axis.text.x=element_text(size=12),
        axis.title.y=element_text(hjust=1),
        axis.text.y=element_text(angle=45),
        axis.ticks = element_blank())

### There are many, many other arguments and functions for theme() that can
### be combined to customize your graph

## C. Legends
