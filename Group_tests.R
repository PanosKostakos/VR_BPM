data <- read.csv("data_BMP/questionnair/data", sep = "\t")
library("MASS")
library(effsize)
library(varhandle)
library("trend")
library(dplyr)
library(readr)
library(ggplot2)
options(scipen=999)

         
#Group Sampling 

#chategorical 
gender <- table(data$Group, data$Gender) 
print(fisher.test(gender,conf.level = 0.95))



military <- table(data$Group, data$Military.Service.division.) 
print(fisher.test(military,conf.level = 0.95))

# How.often.do.you.park.to.an.underground.parking.space.

parking <- table(data$Group, 
                 data$How.often.do.you.park.to.an.underground.parking.space.) 
print(fisher.test(parking))


# How.often.do.you.play.video.games
games <- table(data$Group, data$How.often.do.you.play.video.games.) 
print(fisher.test(games,alternative='g'))


#How.often.do.you.use.virtual.reality.equipment.
vr <- table(data$Group, data$How.often.do.you.use.virtual.reality.equipment.) 
print(fisher.test(vr))


#Continues 
#Welch’s t-test, and Hedges’ g were calculated as a measure of effect size
#for t test, if t is less than 2 it's non-sig, 
#if the p is less that 0.05 you reject the null (there is diff)
#AGE
var.test
age <- data$Age
group <- data$Group
t.test(age ~ group,var.equal = TRUE,conf.level=0.95)

#BMI
var.test
data$BMI<-as.numeric(gsub(",", ".", gsub("\\.", "", data$BMI)))
BMI <- data$BMI
var.test
t.test(BMI ~ group, var.equal = TRUE,conf.level=0.95)


#HR 
#First I will measure the variance of the random signal for all ts
# Then I will run two sided rrod.test (or trend.test) on all ts 

files <- list.files("data_BMP/raw",full.names=TRUE)
tbl <- sapply(files, read_csv,col_name =c("time", "value"), simplify=FALSE) %>%  bind_rows(.id = "id")
tbl$id<-stringr::str_replace(tbl$id, "data_BMP/raw/", "")
attr(tbl$time, "tzone") <- "Europe/Helsinki"
tbl$id = factor(tbl$id, levels = c('user4', 'user5', "user6", "user7",
                                   "user8", "user9",'user10', 'user11', "user12", "user13",
                                   "user14", "user15","user16", "user17","user18","user19", "user20"),
                labels = c(4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20))
#Relative time
tbl<- tbl %>% group_by(id) %>% mutate(counter = row_number())


GroupA <-c(5, 9, 12, 13, 15, 16, 17, 18, 19, 20)
GroupB <- c(6, 10, 11, 4, 7, 8, 14)

Ga<- tbl%>% filter(id %in% GroupA)
Gb<- tbl%>% filter(id %in% GroupB)

var.test(Ga$value, Gb$value)
# If your p > 0.05 run (var.equal = TRUE)
# if F-test returns a p < 0.05 (heteroscedasticity) run (var.equal = FALSE)

t.test(Ga$value, Gb$value, var.equal = FALSE)



# Checkpoints

tsuser4<- user4 %>% filter(counter %in% (626:988))
tsuser6<- user6 %>% filter(counter %in% (455:623))
tsuser10<- user10 %>% filter(counter %in% (607:708))
tsuser11<- user11 %>% filter(counter %in% (532:775))
tsuser7<- user7 %>% filter(counter %in% (448:530))
tsuser8<- user8 %>% filter(counter %in% (552:664))
tsuser14<- user14%>% filter(counter %in% (528:636))

tsuser28<- user28%>% filter(counter %in% (587:856))
tsuser29<- user29%>% filter(counter %in% (509:629))
tsuser30<- user30%>% filter(counter %in% (610:730))
tsuser31<- user31%>% filter(counter %in% (469:529))
tsuser32<- user32%>% filter(counter %in% (497:568))
tsuser33<- user33%>% filter(counter %in% (479:702))
tsuser34<- user34%>% filter(counter %in% (428:584))
tsuser35<- user35%>% filter(counter %in% (519:587))
tsuser36<- user36%>% filter(counter %in% (420:646))





tsuser5<- user5 %>% filter(counter %in% (448:589))
tsuser9<- user9 %>% filter(counter %in% (598:690))
tsuser12<- user12 %>% filter(counter %in% (574:685))
tsuser13<- user13 %>% filter(counter %in% (556:739))
tsuser15<- user15 %>% filter(counter %in% (660:733))
tsuser16<- user16 %>% filter(counter %in% (607:788))
tsuser17<- user17 %>% filter(counter %in% (626:894))
tsuser18<- user18 %>% filter(counter %in% (569:958))
tsuser19<- user19 %>% filter(counter %in% (415:475))
tsuser20<- user20 %>% filter(counter %in% (480:1038))

experimental <- rbind(tsuser4, tsuser6,tsuser10,tsuser11,tsuser7,tsuser8, tsuser14)
                      , 
                      tsuser28,tsuser29,tsuser30,tsuser31,tsuser32,tsuser34,
                      tsuser35,tsuser36)
experimental$counter2 <- seq.int(nrow(experimental))

control <- rbind(tsuser5, tsuser9,tsuser12,tsuser13,tsuser15,tsuser16, tsuser17, tsuser18, 
                 tsuser19,tsuser20)
control$counter2 <- seq.int(nrow(control))


t.test(control$value,experimental$value)

# Mann-Kendall test 


library(trend)

mk.test(tsuser4$value)
mk.test(tsuser6$value)
mk.test(tsuser10$value)
mk.test(tsuser11$value)
mk.test(tsuser7$value)
mk.test(tsuser8$value)
mk.test(tsuser14$value)

mk.test(tsuser5$value)
mk.test(tsuser9$value)
mk.test(tsuser12$value)
mk.test(tsuser13$value)
mk.test(tsuser15$value)
mk.test(tsuser16$value)
mk.test(tsuser17$value)
mk.test(tsuser18$value)
mk.test(tsuser19$value)
mk.test(tsuser20$value)

mk.test(experimental$value)
mk.test(control$value)










#PLOTS

#A
png("Fig_6.png", units="px", width=3000, height=1600, res=300)

par(mfrow=c(1,2), mgp=c(2,1,0),mai=c(1,0.4,0.2,0.1),mar = c(4,4,4,2) + 0.1)

plot(experimental$value, type="l",col="green",  ylab ="HR",main= "Experimental Group", xlab ="Relative time",cex.lab = 0.8,cex.axis= 0.7)
plot(control$value, type="l", col="red", main= "Control Group", ylab ="HR", xlab ="Relative time",cex.lab = 0.8,cex.axis= 0.7)
dev.off()


#B
ggplot(experimental, aes(counter2,value)) +  xlab("Relative time (seconds)") + ylab("Heart Rate (bmp)") +
  ggtitle("Experimental Group")+ 
geom_line(aes(colour = experimental$id), size = 0.5)+
  theme(legend.justification=c(1,0), legend.position=c(1,0))

ggplot(control, aes(counter2,value)) +  xlab("Relative time (seconds)") + ylab("Heart Rate (bmp)") +
  ggtitle("ControlGroup")+ 
  geom_line(aes(colour = control$id), size = 0.5)+
  theme(legend.justification=c(1,0), legend.position=c(1,0))




