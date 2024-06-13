# Making figures with ggplot2 part V: Colors and saving your plots

### In this section, we will review how to customize the colors of your
### figures and save figures to a file using ggplot2.

### For our example data, we will be using the same assembly QC table from the 
### previous section:

df <- read.delim("./data/quast_data.tsv", 
                 header=T, 
                 check.names=F,
                 stringsAsFactors=F,
                 sep="\t")

## A. Brief review

### As discussed in previous sections, we can choose a single color for our plots,
### or we can color our plots by variables in our data set.

### Plotting with a single color is done outside aes():

library(ggplot2)

ggplot(df, aes(x=N50)) + 
  geom_histogram(bins=10, color="black", fill="lightgreen")

### If no color is specified within the geom function, ggplot2 will use black 
### or grey by default.

### Coloring our plot by a variable in our data set is done within aes():

ggplot(df, aes(x=N50, fill=Species)) +
  geom_histogram(bins=10)

### If no color palette is given within aes() when coloring a plot by a variable
### in our data set, ggplot2 uses its built-in color palette by default.

## B. Hue, chroma, and value

### Hue, chroma, and value are part of the Munsell color system, which describes
### the properties of color.

### https://munsell.com/color-blog/munsell-book-of-color-1929-hue-value-chroma/

### Hue is how we distinguish and name the colors present on the color wheel, 
### chroma is the saturation of color, and value is the lightness (or darkness)
### of a color.

### The hue, chroma, and value of the colors in a plot can be changed using the 
### scale_fill_hue() and scale_color_hue() functions.

ggplot(df, aes(x=Species, y=`Total length`, color=Species)) + 
  geom_boxplot(outliers=F)

### Hue is changed with the h parameter [0-360]:
### For example, green is 120 degrees on the color wheel and purple is 270:

ggplot(df, aes(x=Species, y=`Total length`, fill=Species)) + 
  geom_boxplot(color="black", outliers=F) +
  scale_fill_hue(h=c(120,270))

ggplot(df, aes(x=Species, y=`Total length`, color=Species)) + 
  geom_boxplot(outliers=F) +
  scale_color_hue(h=c(120,270))

### Chroma is changed with the c parameter (maximum value varies depending on 
### a combination of hue and value):

ggplot(df, aes(x=Species, y=`Total length`, fill=Species)) + 
  geom_boxplot(color="black", outliers=F) +
  scale_fill_hue(c=20)

ggplot(df, aes(x=Species, y=`Total length`, fill=Species)) + 
  geom_boxplot(color="black", outliers=F) +
  scale_fill_hue(c=150)

### Value is changed with the l (lightness) parameter [0,100]:

ggplot(df, aes(x=Species, y=`Total length`, fill=Species)) + 
  geom_boxplot(color="black", outliers=F) +
  scale_fill_hue(l=90)

ggplot(df, aes(x=Species, y=`Total length`, fill=Species)) + 
  geom_boxplot(color="black", outliers=F) +
  scale_fill_hue(l=10)

### C. Manually choosing colors

### Colors palettes can be chosen manually using scale_color_manual() and
### scale_fill_manual(). Colors should be in hex code format. For example:

cp2 <- c("#6e0067","#3ff0a1")

cp4 <- c("#d15124","#002691","#60c250","#484e00")

### There are many websites for generating color palettes. I prefer i want hue:
### http://medialab.github.io/iwanthue/

### scale_fill_manual() can be used for figures like box plots, histograms, etc:

ggplot(df, aes(x=Species, y=`Total length`, fill=Species)) + 
  geom_boxplot(color="black", outliers=F) +
  scale_fill_manual(values=cp2)

### scale_color_manual() can be used for figures like line plots and scatter plots:

ggplot(df, aes(x=`Largest contig`, y=`Total length`, color=AMR)) + 
  geom_point() +
  scale_color_manual(values=cp4)


### ggplot2 also has grey color scale functions, scale_fill_grey() and 
### scale_color_grey():

ggplot(df, aes(x=Species, y=`Total length`, fill=Species)) + 
  geom_boxplot(color="black", outliers=F) +
  scale_fill_grey()

ggplot(df, aes(x=`Largest contig`, y=`Total length`, color=AMR)) + 
  geom_point() +
  scale_color_grey()

?scale_fill_grey()

### Color gradients for continuous variables can be set using scale_color_gradient() 
### and scale_fill_gradient():

ggplot(df, aes(x=`Largest contig`, y=`Total length`, color=`N50`)) + 
  geom_point() +
  scale_color_gradient()

### We can use the high and low parameters to choose either end of gradients, and 
### ggplot2 will automatically create a gradient using those colors:

ggplot(df, aes(x=`Largest contig`, y=`Total length`, color=`N50`)) + 
  geom_point() +
  scale_color_gradient(low="#6e0067", high="#3ff0a1")

### Additionally, scale_fill/color_gradient2() can be used to create a color 
### gradient with a chosen middle color aka a diverging color gradient:

ggplot(df, aes(x=`Largest contig`, y=`Total length`, color=`N50`)) + 
  geom_point() +
  scale_color_gradient2(low="#6e0067", high="#3ff0a1", mid="grey",
                        midpoint=mean(df$N50))

## D. Color palette modules

### There are many color palette modules for R that have been written.
### Some examples include:

library(RColorBrewer)
### https://r-graph-gallery.com/38-rcolorbrewers-palettes.html

ggplot(df, aes(x=`Largest contig`, y=`Total length`, color=AMR)) + 
  geom_point() +
  scale_color_brewer(palette="Set1")

library(viridis)
### https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html

ggplot(df, aes(x=`Largest contig`, y=`Total length`, color=AMR)) + 
  geom_point() +
  scale_color_viridis(option="plasma", discrete=T)

library(ggDracula)
### https://github.com/dracula/ggplot2

ggplot(df, aes(x=`Largest contig`, y=`Total length`, color=AMR)) + 
  geom_point() +
  scale_color_dracula(discrete=T)

## E. Saving your plot

### The easiest way to save your plot is using ggsave()
### ggsave() will save the last figure you plotted to a file by default,
### or you can supply it a variable containing a plot

?ggsave

ggsave("my_plot.png",
       path="./figures/",
       width=5,
       height=5,
       units="in",
       dpi=300)

my_plot <- ggplot(df, aes(x=`Largest contig`, y=`Total length`, color=AMR)) + 
  geom_point() +
  scale_color_viridis(option="plasma", discrete=T)
my_plot

ggsave("my_plot.png",
       plot=my_plot,
       path="./figures/",
       width=5,
       height=5,
       units="in",
       dpi=300)
