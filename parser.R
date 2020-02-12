library(plyr)
library(readr)
library(dplyr)

files <- list.files("data_BMP",full.names=TRUE)
tbl <- sapply(files, read_csv,col_name =c("time", "value"), simplify=FALSE) %>% 
  bind_rows(.id = "id")

tbl$id<-stringr::str_replace(tbl$id, "data_BMP/", "")

#Conver timezone
attr(tbl$time, "tzone") <- "Europe/Helsinki"




#Levels
tbl$id = factor(tbl$id, levels = c('user4', 'user5', "user6", "user7",
                                  "user8", "user9",'user10', 'user11', "user12", "user13",
                                  "user14", "user15","user16", "user17"),
                        labels = c(4,5,6,7,8,9,10,11,12,13,14,15,16,17))


# Plot all time series 

#ggplot(tbl,aes(x=time, y=value, group=id, color=id)) +geom_line()


# Plot time series with vertical lines

user4<- tbl %>% filter(id == "4") 
user4_cp <- 

plot(user4$time, user4$value, type='l')

v=as.numeric(user4$time[c(4,600,44)])
abline(v=v, lwd=2, col='red')




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
  (bpm.min + 70) / 2,
  (109 + 80) / 2, 
  (80 + 90) / 2, 
  (90 + 107) / 2,
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
