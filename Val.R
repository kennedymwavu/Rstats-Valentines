library(ggplot2)
library(ggthemes)
library(emojifont)

showtext::showtext_auto()

# load google fonts:
sysfonts::font_add_google("Schoolbell", "bell")

# search for emojis:
emojifont::search_emoji("star")
emojifont::search_emoji("rose")

df <- tibble::tibble(
  t = seq(from = -10, to = 10, by = 0.01),
  x = 16 * sin(t)**3,
  y = 13 * cos(t) - 5 * cos(2 * t) - 2 * cos(3 * t) - cos(4 * t)
)

ggplot() +
  geom_point(
    data = df |> dplyr::filter(x <= 0), 
    mapping = aes(x = x, y = y), 
    colour = "white"
  ) +
  geom_point(
    data = df |> dplyr::filter(x > 0), 
    mapping = aes(x = x, y = y)
  ) +
  geom_line(
    data = df |> dplyr::filter(x > 0),
    mapping = aes(x = x, y = y),
    color = "red", alpha = 0.8
  ) +
  geom_line(
    data = df |> dplyr::filter(x <= 0), 
    mapping = aes(x = x, y = y)
  ) +
  geom_point(
    mapping = aes(
      x = c(-10, 10, 0, -5, 5, -15, 15), 
      y = c(-10, -10, 10, rep(-15, 4))
    ),
    shape = 23, 
    colour = "red", 
    fill = "red", 
    size = 3
  ) +
  geom_point(
    mapping = aes(x = 0, y = -5:-10),
    shape = 23, 
    color = "firebrick", 
    fill = "firebrick", 
    size = 1.7
  ) +
  geom_point(
    mapping = aes(x = 0, y = -4:5),
    shape = 23, 
    color = "black", 
    fill = "black", 
    size = 2, 
    alpha = 0.7
  ) +
  emojifont::geom_emoji(
    alias = "rose", 
    color = "white", 
    size = 80, 
    x = -0.2, 
    y = -8, 
    alpha = 0.8
  ) +
  emojifont::geom_emoji(
    alias = "star", 
    x = c(-10, 10, 0, -5, 5, -15, 15), 
    y = c(-10, -10, 10, rep(-15, 4)), 
    size = 10, 
    color = "red"
  ) +
  geom_text(
    mapping = aes(x = 0, y = 0),
    label = "Rstats", 
    colour = "white", 
    size = 11, 
    family = "bell"
  ) +
  geom_text(
    mapping = aes(x = 0.2, y = 2),
    label = "Happy Valentines", 
    color = "white", 
    size = 11, 
    family = "bell"
  ) +
  theme_few() +
  coord_fixed() +
  theme(
    panel.grid = element_blank(), # remove grid lines, axis titles, texts and ticks.
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank()
  )
