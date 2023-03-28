install.packages("cowplot")
library(ggplot2)
library(scales)
library(cowplot)

# create a separate data frame for "Personal savings rate"
savings <- data.frame(date = economics$date, psavert = economics$psavert)

# create the first plot for "Unemployment" and "Personal consumption expenditures"
p1 <- ggplot(economics, aes(x = date)) +
  geom_line(aes(y = unemploy, color = "Unemployment")) +
  geom_line(aes(y = pce, color = "Personal consumption expenditures")) +
  labs(x = "Year", y = "Unemployment / Consumption", color = "Variable") +
  scale_color_manual(values = c("red", "blue")) +
  theme_bw()

# create the second plot for "Personal savings rate"
p2 <- ggplot(savings, aes(x = date, y = psavert)) +
  geom_line(color = "green") +
  labs(y = "Personal savings rate") +
  scale_y_continuous(labels = scales::percent) +
  theme_bw()

# combine the two plots using cowplot
plot_grid(p1 + theme(legend.position = "none"),
          p2 + theme(axis.title.y = element_blank(),
                     axis.text.y = element_blank(),
                     axis.ticks.y = element_blank(),
                     panel.grid.major.y = element_blank()),
          ncol = 1, align = "v", axis = "l")



