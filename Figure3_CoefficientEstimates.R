#use "install.packages('package_name')" to install required packages 

library(ggplot2)
library(ggthemes)
library(stringr)

ggplot(data, aes(x = Variable, y = Genus, fill = Estimate)) + 
  geom_tile(color = 'black', size = 0.2) +
  geom_text(aes(fill = Estimate, label = round(Estimate, 2)), color = "black", size = 3) + #add numbers to the boxes
  xlim(levels(data_long$Var)) + 
  facet_grid(Division ~., switch = 'y', scales = "free_y", space = "free_y", drop = TRUE) +
  scale_fill_gradient2(low = "#0033FF", mid = "#FFFFFF", high = "#CC3300") + 
  theme_few() +
  theme(axis.title.y = element_blank(),
        axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 90, size = 11, hjust = 0.95, vjust = 0.5),
        axis.text.y = element_text(size = 11),
        axis.ticks = element_blank(),
        legend.position = "right") +
  scale_x_discrete(labels = function(x) str_wrap(x, width = 15))
