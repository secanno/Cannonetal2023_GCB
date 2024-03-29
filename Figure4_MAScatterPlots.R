
library(ggplot2)
library(scales)


ggplot(data, aes(x = Vals, y = percent)) + 
  geom_point(aes(color = Divisions, fill = Divisions, shape = Divisions), color = "black") + 
  geom_smooth(method = 'glm', na.rm = TRUE, linetype = "dashed", color = "yellow", linewidth = 0.5) + #add trend line
  scale_shape_manual(guide = "legend", values = c("Brown" = 21, 
                                                  "Green" = 22,
                                                  "Red" = 23)) + #add shapes for each of the divisions
  scale_fill_manual(guide = "legend", values = c("Brown" = "burlywood4", 
                                                 "Green" = "forestgreen", 
                                                 "Red" = "tomato1"), #colors for each division
                    aesthetics = "fill") +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) + #format y axis labels as percents
  guides(fill = "none", shape = "none") +
  xlab("") + ylab("Percent of Total Cover") +
  theme_minimal() + 
  theme(panel.background = element_rect(fill = NA, color = "black"), 
        panel.spacing = unit(0.7, "lines"),
        text = element_text(size = 12),
        axis.text = element_text(size = 9)) +
  facet_grid(cols = vars(Divisions),
             rows = vars(Vars),
             labeller = as_labeller(data_long2$Divisions, default=label_wrap_gen(20)))
