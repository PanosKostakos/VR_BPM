library(plyr)
library(readr)
library(dplyr)

files <- list.files("HR",full.names=TRUE)
tbl <- sapply(files, read_csv,col_name =c("time", "value"), simplify=FALSE) %>% 
  bind_rows(.id = "id")

#Conver timezone

tbl$time <- format(tbl$time,usetz=TRUE, tz="Europe/Helsinki")

#Levels
tbl$id = factor(tbl$id, levels = c('./user4', './user5', "./user6", "./user7",
                                  "./user8", "./user9"),
                        labels = c(4,5,6,7,8,9))

#Ploting min and max for all users
library(ggplot2)
ggplot(data = tbl, mapping = aes(x = id, y = value)) +
  geom_boxplot()
dev.copy(png,'./figures/Box1.png')
dev.off()

ggplot(data = tbl, mapping = aes(x = id, y = value)) +
  geom_boxplot(alpha = 0) +
  geom_jitter(alpha = 0.3, color = "tomato")
dev.copy(png,'./figures/Box2.png')
dev.off()


# Violin basic
library(hrbrthemes)
library(viridis)
tbl %>%
  ggplot( aes(x=id, y=value, fill=id)) +
  geom_violin() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6, option="A") +
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("Violin chart") +
  xlab("")
dev.copy(png,'./figures/violin.png')
dev.off()


library(ggjoy)

bpm.min <- min(tbl$value, na.rm = T)
bpm.max <- max(tbl$value, na.rm = T)

breaks <- c(
  bpm.min,
  (bpm.min + 109) / 2,
  (109 + 123) / 2, 
  (123 + 138) / 2, 
  (138 + 164) / 2,
  bpm.max
)

ggplot(
  tbl,
  aes(x = value, y = id, height = ..density.., fill = ..x..)
) +
  scale_fill_gradientn(
    colors = c("royalblue", "royalblue", "green", "yellow", "orange", "red"),
    breaks = breaks
  ) +
  geom_joy_gradient(na.rm = TRUE, col = "grey70", scale = 1) +
  theme_joy(font_size = 10) +
  theme(
    legend.position = "none"
  )
dev.copy(png,'./figures/Hist1.png')
dev.off()
