# Making figures with ggplot2 part IV: Colors and saving your plots

## Saving your plot

### The easiest way to save your plot is using ggave()
### ggsave() with save the last figure you plotted to a file by default,
### or you can supply it a variable containing a plot

ggsave("my_plot.png",
       plot = last_plot(),
       path = "",
       width = 5,
       height = 5,
       units = "in")
