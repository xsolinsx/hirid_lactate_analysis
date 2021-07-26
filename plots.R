library(ggplot2)
options(scipen = 999)

for (f in list.files("./results/distribution_plots", pattern = "*.csv")) {
  tmp <- read.csv(paste("./results/distribution_plots",
    f,
    sep = "/"
  ))
  ggplot(tmp, aes(y = value)) +
    geom_boxplot() +
    ggtitle(gsub(".csv", "", f)) +
    ylab("Value") +
    theme_bw() +
    theme(
      axis.ticks.x = element_blank(),
      axis.text.x = element_blank()
    )
  ggsave(
    paste(
      "./results/distribution_plots",
      gsub(".csv", " BOX.jpg", f),
      sep = "/"
    ),
    width = 6,
    height = 6,
  )
  ggplot(tmp, aes(x = value)) +
    geom_histogram() +
    ggtitle(gsub(".csv", "", f)) +
    xlab("Value") +
    ylab("Count") +
    theme_bw()
  ggsave(
    paste(
      "./results/distribution_plots",
      gsub(".csv", " HIST.jpg", f),
      sep = "/"
    ),
    width = 6,
    height = 6
  )
}

# manual plotting
f <- "Fluid balance in.csv"
tmp <- read.csv(paste("./results/distribution_plots",
  f,
  sep = "/"
))
ggplot(tmp, aes(y = value)) +
  geom_boxplot() +
  ggtitle(gsub(".csv", "", f)) +
  ylab("Value") +
  theme_bw() +
  theme(
    axis.ticks.x = element_blank(),
    axis.text.x = element_blank()
  )
ggsave(
  paste(
    "./results/distribution_plots",
    gsub(".csv", " BOX.jpg", f),
    sep = "/"
  ),
  width = 6,
  height = 6,
)
ggplot(tmp, aes(x = value)) +
  geom_histogram() +
  ggtitle(gsub(".csv", "", f)) +
  xlab("Value") +
  ylab("Count") +
  theme_bw()
ggsave(
  paste(
    "./results/distribution_plots",
    gsub(".csv", " HIST.jpg", f),
    sep = "/"
  ),
  width = 6,
  height = 6
)
