library(ggplot2)
options(scipen = 999)

# plot original distributions
for (f in list.files("./results/distribution_plots/data")) {
  tmp <- read.csv(paste("./results/distribution_plots/data",
    f,
    sep = "/"
  ))
  print(f)
  # boxplot
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
      gsub(".csv", " BOX.png", f),
      sep = "/"
    ),
    width = 6,
    height = 6,
  )
  # histogram
  ggplot(tmp, aes(x = value)) +
    geom_histogram() +
    ggtitle(gsub(".csv", "", f)) +
    xlab("Value") +
    ylab("Count") +
    theme_bw()
  ggsave(
    paste(
      "./results/distribution_plots",
      gsub(".csv", " HIST.png", f),
      sep = "/"
    ),
    width = 6,
    height = 6
  )
}
