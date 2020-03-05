library(plyr)
library(readr)
library(dplyr)
library(tidyverse)

files <- list.files("data_BMP/raw",full.names=TRUE)
tbl <- sapply(files, read_csv,col_name =c("time", "value"), simplify=FALSE) %>% 
  bind_rows(.id = "id")

tbl$id<-stringr::str_replace(tbl$id, "data_BMP/raw/", "")

#Conver timezone
attr(tbl$time, "tzone") <- "Europe/Helsinki"

#Relative time
#tbl<- tbl %>% group_by(id) %>% mutate(counter = row_number())
tbl<- tbl %>% group_by(id) %>% mutate(counter = row_number())

# library(data.table)
# tbl <- data.table(tbl)
# tbl[, counter := seq_len(.N), by = id]
# tbl[, counter := rowid(id)]


#Levels
tbl$id = factor(tbl$id, levels = c('user4', 'user5', "user6", "user7",
                                  "user8", "user9",'user10', 'user11', "user12", "user13",
                                  "user14", "user15","user16", "user17","user18","user19", "user20",
                                  "user28", "user29",
                                  "user30", "user31","user32", "user33","user34","user35", "user36"),
                        labels = c(4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,28,29,30,31,32,33,34,35,36))



#Metadata
library(readr)
meta_data <- read_tsv("meta_data.csv", col_names = TRUE)
meta_data$Start_time<- strptime(meta_data$Start_time, format="%m.%d.%Y %H.%M.%S")
meta_data$End_time<- strptime(meta_data$End_time, format="%m.%d.%Y %H.%M.%S")



# Plot time series with vertical lines
user4<- tbl %>% filter(id == "4")

#start 2020-10-02 02:52:56

meta_data[ ,1:3]
user4 %>% filter(time == "2020-2-10 14:52:56")
user4 %>% filter(time == "2020-2-10 14:58:58")        
# ggplot(data=user4, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(626,988),colour="#BB0000")


# Plot time series with vertical lines
user5<- tbl %>% filter(id == "5")

meta_data[ ,1:3]
user5 %>% filter(time == "2020-2-10 15:16:45")
user5 %>% filter(time == "2020-2-10 15:19:06")          
# plot(user5$counter, user5$value, type='l')
# abline(v=c(448,589), lwd=2, col='red')
# ggplot(data=user5, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(448,589),colour="#BB0000")

# Plot time series with vertical lines
user6<- tbl %>% filter(id == "6")

meta_data[ ,1:3]
user6 %>% filter(time == "2020-2-10 15:37:34")
user6 %>% filter(time == "2020-2-10 15:40:22")          
# plot(user6$counter, user6$value, type='l')
# abline(v=c(455,623), lwd=2, col='red')
# ggplot(data=user6, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(455,623),colour="#BB0000")

# Plot time series with vertical lines
user7<- tbl %>% filter(id == "7")

meta_data[ ,1:3]
user7 %>% filter(time == "2020-2-10 15:57:48")
user7 %>% filter(time == "2020-2-10 15:59:10")          
# plot(user7$counter, user7$value, type='l')
# abline(v=c(455,623), lwd=2, col='red')
# ggplot(data=user7, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(448,530),colour="#BB0000")


# Plot time series with vertical lines
user8<- tbl %>% filter(id == "8")

meta_data[ ,1:3]
user8 %>% filter(time == "2020-2-10 16:23:57")
user8 %>% filter(time == "2020-2-10 16:25:49")          
# plot(user8$counter, user8$value, type='l')
# abline(v=c(552,664), lwd=2, col='red')
# 
# ggplot(data=user8, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(552,664),colour="#BB0000")


# Plot time series with vertical lines
user9<- tbl %>% filter(id == "9")

meta_data[ ,1:3]
user9 %>% filter(time == "2020-2-10 16:47:32")
user9 %>% filter(time == "2020-2-10 16:49:04")          
# plot(user9$counter, user9$value, type='l')
# abline(v=c(598,690), lwd=2, col='red')
# 
# ggplot(data=user9, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(598,690),colour="#BB0000")

# Plot time series with vertical lines
user10<- tbl %>% filter(id == "10")

meta_data[ ,1:3]
user10 %>% filter(time == "2020-2-11 12:26:54")
user10 %>% filter(time == "2020-2-11 12:28:35")          
# plot(user10$counter, user10$value, type='l')
# abline(v=c(607,708), lwd=2, col='red')
# ggplot(data=user10, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(607,708),colour="#BB0000")


# Plot time series with vertical lines
user11<- tbl %>% filter(id == "11")

meta_data[ ,1:3]
user11 %>% filter(time == "2020-2-11 12:52:13")
user11 %>% filter(time == "2020-2-11 12:56:16")          
# plot(user11$counter, user11$value, type='l')
# abline(v=c(532,775), lwd=2, col='red')
# ggplot(data=user11, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(532,775),colour="#BB0000")


# Plot time series with vertical lines
user12<- tbl %>% filter(id == "12")

meta_data[ ,1:3]
user12 %>% filter(time == "2020-2-11 13:20:44")
user12 %>% filter(time == "2020-2-11 13:22:35")          
# plot(user12$counter, user12$value, type='l')
# abline(v=c(574,685), lwd=2, col='red')
# ggplot(data=user12, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(574,685),colour="#BB0000")

# Plot time series with vertical lines
user13<- tbl %>% filter(id == "13")

meta_data[ ,1:3]
user13 %>% filter(time == "2020-2-11 13:43:46")
user13 %>% filter(time == "2020-2-11 13:46:49")          
# plot(user13$counter, user13$value, type='l')
# abline(v=c(556,739), lwd=2, col='red')
# 
# ggplot(data=user13, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(556,739),colour="#BB0000")


# Plot time series with vertical lines
user14<- tbl %>% filter(id == "14")

meta_data[ ,1:3]
user14 %>% filter(time == "2020-2-11 14:07:32")
user14 %>% filter(time == "2020-2-11 14:09:20")          
# plot(user14$counter, user14$value, type='l')
# abline(v=c(528,636), lwd=2, col='red')
# ggplot(data=user14, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(528,636),colour="#BB0000")


# Plot time series with vertical lines
user15<- tbl %>% filter(id == "15")

meta_data[ ,1:3]
user15 %>% filter(time == "2020-2-11 14:47:32")
user15 %>% filter(time == "2020-2-11 14:48:45")          
# plot(user15$counter, user15$value, type='l')
# abline(v=c(660,733), lwd=2, col='red')
# ggplot(data=user15, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(660,733),colour="#BB0000")



# Plot time series with vertical lines
user16<- tbl %>% filter(id == "16")

meta_data[ ,1:3]
user16 %>% filter(time == "2020-2-11 15:11:40")
user16 %>% filter(time == "2020-2-11 15:14:41")          
# plot(user16$counter, user16$value, type='l')
# abline(v=c(607,788), lwd=2, col='red')
# 
# ggplot(data=user16, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(607,788),colour="#BB0000")


# Plot time series with vertical lines
user17<- tbl %>% filter(id == "17")

meta_data[ ,1:3]
user17 %>% filter(time == "2020-2-11 15:40:15")
user17 %>% filter(time == "2020-2-11 15:44:43")          
# plot(user17$counter, user17$value, type='l')
# abline(v=c(626,894), lwd=2, col='red')
# 

# # Plot time series with vertical lines
user18<- tbl %>% filter(id == "18")

meta_data[ ,1:3]
user18 %>% filter(time == "2020-2-12 14:38:18")
user18 %>% filter(time == "2020-2-12 14:44:47")
# plot(user18$counter, user18$value, type='l')
# abline(v=c(569,958), lwd=2, col='red')

user19<- tbl %>% filter(id == "19")
meta_data[ ,1:3]
user19 %>% filter(time == "2020-2-12 15:05:28")
user19 %>% filter(time == "2020-2-12 15:06:28")          
# plot(user19$counter, user19$value, type='l')
# abline(v=c(415,475), lwd=2, col='red')


user20<- tbl %>% filter(id == "20")
meta_data[ ,1:3]
user20 %>% filter(time == "2020-2-12 15:42:09")
user20 %>% filter(time == "2020-2-12 15:51:27")          
# plot(user20$counter, user20$value, type='l')
# abline(v=c(480,1038), lwd=2, col='red')
# 

user28<- tbl %>% filter(id == "28")
meta_data[ 18:26,1:3]
user28 %>% filter(time == "2020-02-27 13:20:20")
user28 %>% filter(time == "2020-02-27 13:24:49")          
#ggplot(data=user28, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(587,856),colour="#BB0000") +  labs(x = "User20", y = "")

user29<- tbl %>% filter(id == "29")
meta_data[ 18:26,1:3]
user29 %>% filter(time == "2020-02-27 13:55:03")
user29 %>% filter(time == "2020-02-27 13:57:03")          
#ggplot(data=user29, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(509,629),colour="#BB0000") +  labs(x = "User20", y = "")

user30<- tbl %>% filter(id == "30")
meta_data[ 18:26,1:3]
user30 %>% filter(time == "2020-02-27 14:26:06")
user30 %>% filter(time == "2020-02-27 14:28:06")          
ggplot(data=user30, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(610,730),colour="#BB0000") +  labs(x = "User20", y = "")

user31<- tbl %>% filter(id == "31")
meta_data[ 18:26,1:3]
user31 %>% filter(time == " 2020-02-27 15:20:35")
user31 %>% filter(time == " 2020-02-27 15:21:35")          
ggplot(data=user31, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(469,529),colour="#BB0000") +  labs(x = "User20", y = "")


user32<- tbl %>% filter(id == "32")
meta_data[ 18:26,1:3]
user32 %>% filter(time == "2020-02-28 13:22:05")
user32 %>% filter(time == " 2020-02-28 13:23:16")          
ggplot(data=user32, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(497,568),colour="#BB0000") +  labs(x = "User20", y = "")


# user33<- tbl %>% filter(id == "33")
# meta_data[ 18:26,1:3]
# user33 %>% filter(time == "2020-02-28 14:15:50")
# user33 %>% filter(time == "2020-02-28 14:19:33")          
# ggplot(data=user33, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(479,702),colour="#BB0000") +  labs(x = "User20", y = "")


user34<- tbl %>% filter(id == "34")
meta_data[ 18:26,1:3]
user34 %>% filter(time == "2020-02-28 15:09:40")
user34 %>% filter(time == "2020-02-28 15:12:16")          
ggplot(data=user34, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(428,584),colour="#BB0000") +  labs(x = "User20", y = "")


user35<- tbl %>% filter(id == "35")
meta_data[ 18:26,1:3]
user35 %>% filter(time == "2020-03-03 12:41:00")
user35 %>% filter(time == "2020-03-03 12:42:08")          
ggplot(data=user35, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(519,587),colour="#BB0000") +  labs(x = "User20", y = "")


user36<- tbl %>% filter(id == "36")
meta_data[ 18:26,1:3]
user36 %>% filter(time == "2020-03-03 13:12:00")
user36 %>% filter(time == "2020-03-03 13:15:46")          
ggplot(data=user36, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(420,646),colour="#BB0000") +  labs(x = "User20", y = "")






#Multi Plot
library(gridExtra)
library(ggplot2)
p4<- ggplot(data=user4, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(626,988),colour="#BB0000") +   labs(x = "User1", y = "")
p5 <- ggplot(data=user5, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(448,589),colour="#BB0000") +  labs(x = "User2", y = "")
p6 <- ggplot(data=user6, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(455,623),colour="#BB0000") +  labs(x = "User3", y = "")
p7 <- ggplot(data=user7, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(448,530),colour="#BB0000") +  labs(x = "User4", y = "")
p8 <- ggplot(data=user8, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(552,664),colour="#BB0000") +  labs(x = "User5", y = "")
p9 <- ggplot(data=user9, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(598,690),colour="#BB0000") +  labs(x = "User6", y = "")
p10 <- ggplot(data=user10, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(607,708),colour="#BB0000") +  labs(x = "User7", y = "")
p11 <- ggplot(data=user11, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(532,775),colour="#BB0000") +  labs(x = "User8", y = "")
p12 <- ggplot(data=user12, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(574,685),colour="#BB0000") +  labs(x = "User9", y = "")
p13<- ggplot(data=user13, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(556,739),colour="#BB0000") +  labs(x = "User10", y = "")
p14 <- ggplot(data=user14, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(528,636),colour="#BB0000") +  labs(x = "User11", y = "")
p15 <- ggplot(data=user15, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(660,733),colour="#BB0000") +  labs(x = "User12", y = "")
p16 <- ggplot(data=user16, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(607,788),colour="#BB0000") +  labs(x = "User13", y = "")
p17 <- ggplot(data=user17, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(626,894),colour="#BB0000") +  labs(x = "User14", y = "")
p18 <- ggplot(data=user18, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(569,958),colour="#BB0000") +  labs(x = "User15", y = "")
p19 <- ggplot(data=user19, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(415,475),colour="#BB0000") +  labs(x = "User16", y = "")
p20 <- ggplot(data=user20, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(480,1038),colour="#BB0000") +  labs(x = "User17", y = "")

png("figures/Fig5.png", units="px", width=3000, height=1600, res=300)

grid.arrange(p5,p9,p12,p13,p15,p16,p17,p18,p19,p20, ncol=3,top="Control Group", 
             left="HR")
dev.off()

png("figures/Fig5_btm.png", units="px", width=3000, height=1600, res=300)
grid.arrange(p4,p7, p8,p14, p6,p10,p11, ncol=3,top="Experimental Group", bottom="Users", 
             left="HR")
dev.off()



#HR

tsuser4<- user4 %>% filter(counter %in% (626:988))
tsuser5<- user5 %>% filter(counter %in% (448:589))
tsuser6<- user6 %>% filter(counter %in% (455:623))
tsuser7<- user7 %>% filter(counter %in% (448:530))
tsuser8<- user8 %>% filter(counter %in% (552:664))
tsuser9<- user9 %>% filter(counter %in% (598:690))

tsuser10<- user10 %>% filter(counter %in% (607:708))
tsuser11<- user11 %>% filter(counter %in% (532:775))
tsuser12<- user12 %>% filter(counter %in% (574:685))
tsuser13<- user13 %>% filter(counter %in% (556:739))
tsuser14<- user14%>% filter(counter %in% (528:636))
tsuser15<- user15 %>% filter(counter %in% (660:733))
tsuser16<- user16 %>% filter(counter %in% (607:788))
tsuser17<- user17 %>% filter(counter %in% (626:894))
tsuser18<- user18 %>% filter(counter %in% (569:958))
tsuser19<- user19 %>% filter(counter %in% (415:475))
tsuser20<- user20 %>% filter(counter %in% (480:1038))







 
# Smouthing https://www.nature.com/articles/sdata201876


#Plot relative times of all users

library(ggplot2)
ggplot(tbl, aes(x = tbl$counter, y = tbl$value, colour = id)) +
  geom_line() +
  geom_smooth(method = "lm") +
  facet_wrap( ~ id)
dev.copy(png,'./figures/all.png')
dev.off()

#Ploting min and max for all users
library(ggplot2)
ggplot(data = tbl, mapping = aes(x = id, y = value)) +
  geom_boxplot()
dev.copy(png,'./figures/Box1.png')
dev.off()

ggplot(data = tbl, mapping = aes(x = id, y = value)) +
  geom_boxplot(alpha = 0) +
  geom_jitter(alpha = 0.1, color = "tomato")
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




