

library(ggplot2)
library(stringr)
library(RColorBrewer)

colorCount <- length(unique(data_long$Genus)) #add colors for different genera
getPalette <- colorRampPalette(brewer.pal(13, "Spectral")) #select colors expanding from an existing palette

#Figure 2a stacked bar chart
ggplot(data2, aes(fill = factor(Genus, levels = c("OtherRed", "OtherBrown", "OtherGreen", "Ceratodictyon", "Caulerpa", "Galaxaura", "Hypnea", "Lobophora", "Microdictyon", "Padina", "Sargassum", "Turbinaria", "Halimeda")), y = Percent, x = realm)) + 
  geom_bar(position = "fill", stat = "identity") + 
  scale_y_continuous(labels = scales::percent) + 
  scale_x_discrete(labels = function(realm) str_wrap(realm, width = 12)) +
  scale_fill_manual(values = getPalette(colorCount)) +
  xlab("") + ylab("% of Total Macroalgae Cover") + 
  theme_few() + 
  #theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  guides(fill = guide_legend('Macroalgae Genera'))


#Figure 2b violin plot 
ggplot(data3, aes(x = realm, y = Percent, fill = realm)) + 
  geom_violin() +
  scale_fill_brewer(palette = "Spectral", guide = "none") +
  geom_boxplot(color = "#555555", width = 0.05, fill = "white", outlier.shape = NA) +
  scale_y_continuous(labels = scales::percent) +
  scale_x_discrete(labels = function(realm) str_wrap (realm, width = 12)) + 
  xlab("") + ylab("% Mean Total Macroalgae Cover") +
  theme_few()



