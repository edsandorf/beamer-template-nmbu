# Plots for NMBU-example-latex.tex. Same code and size as the chunks in
# NMBU-example-quarto.qmd, so both example decks show identical figures.
# Run from the repo root: Rscript figs/make-figures.R

library(ggplot2)

stopping_distance <- ggplot(cars, aes(speed, dist)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ x) +
  labs(x = "Speed (mph)", y = "Stopping distance (ft)") +
  theme_minimal()
ggsave("figs/stopping-distance.pdf", stopping_distance, width = 5.5, height = 2.6)

mpg_weight <- ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  labs(x = "Weight (1000 lbs)", y = "Miles per gallon") +
  theme_minimal()
ggsave("figs/mpg-weight.pdf", mpg_weight, width = 3, height = 2.6)
