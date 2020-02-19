
library(astsa, quietly=TRUE, warn.conflicts=FALSE)
library(ggplot2)
library(knitr)
library(printr)
library(plyr)
library(dplyr)
library(lubridate)
library(gridExtra)
library(reshape2)
library(TTR)



gift4<- ts(user4[3], frequency=24)
birthsComp4 <- decompose(gift4)
trend_4 <-as.data.frame(birthsComp4$trend)
trend_4<- trend_4 %>% mutate(counter = row_number())
ggplot(data=trend_4, aes (x=counter, y=V1))+ geom_line() + geom_vline(xintercept = c(626,988),colour="#BB0000") +   labs(x = "User4", y = "")

gift4<- ts(user5[3], frequency=24)
birthsComp4 <- decompose(gift4)
trend_5 <-as.data.frame(birthsComp4$trend)
trend_5<- trend_5 %>% mutate(counter = row_number())
ggplot(data=trend_4, aes (x=counter, y=V1))+ geom_line() + geom_vline(xintercept = c(448,589),colour="#BB0000") +   labs(x = "User4", y = "")

gift<- ts(user6[3], frequency=24)
birthsComp <- decompose(gift)
trend_6 <-as.data.frame(birthsComp$trend)
trend_6<- trend_6 %>% mutate(counter = row_number())
ggplot(data=trend_6, aes (x=counter, y=V1))+ geom_line() + geom_vline(xintercept = c(455,623),colour="#BB0000") +   labs(x = "User4", y = "")

gift<- ts(user7[3], frequency=24)
birthsComp <- decompose(gift)
trend_7 <-as.data.frame(birthsComp$trend)
trend_7<- trend_7 %>% mutate(counter = row_number())
ggplot(data=trend_7, aes (x=counter, y=V1))+ geom_line() + geom_vline(xintercept = c(448,530),colour="#BB0000") +   labs(x = "User4", y = "")


gift<- ts(user8[3], frequency=24)
birthsComp <- decompose(gift)
trend_8 <-as.data.frame(birthsComp$trend)
trend_8<- trend_8 %>% mutate(counter = row_number())
ggplot(data=trend_8, aes (x=counter, y=V1))+ geom_line() + geom_vline(xintercept = c(552,664),colour="#BB0000") +   labs(x = "User4", y = "")


gift<- ts(user9[3], frequency=24)
birthsComp <- decompose(gift)
trend_9 <-as.data.frame(birthsComp$trend)
trend_9<- trend_9 %>% mutate(counter = row_number())
ggplot(data=trend_9, aes (x=counter, y=V1))+ geom_line() + geom_vline(xintercept = c(598,690),colour="#BB0000") +   labs(x = "User4", y = "")

gift<- ts(user10[3], frequency=24)
birthsComp <- decompose(gift)
trend_10 <-as.data.frame(birthsComp$trend)
trend_10<- trend_10 %>% mutate(counter = row_number())
ggplot(data=trend_10, aes (x=counter, y=V1))+ geom_line() + geom_vline(xintercept = c(607,708),colour="#BB0000") +   labs(x = "User4", y = "")


gift<- ts(user11[3], frequency=24)
birthsComp <- decompose(gift)
trend_11 <-as.data.frame(birthsComp$trend)
trend_11<- trend_11 %>% mutate(counter = row_number())
ggplot(data=trend_11, aes (x=counter, y=V1))+ geom_line() + geom_vline(xintercept = c(532,775),colour="#BB0000") +   labs(x = "User4", y = "")

gift<- ts(user12[3], frequency=24)
birthsComp <- decompose(gift)
trend_12 <-as.data.frame(birthsComp$trend)
trend_12<- trend_12 %>% mutate(counter = row_number())
ggplot(data=trend_12, aes (x=counter, y=V1))+ geom_line() + geom_vline(xintercept = c(574,685),colour="#BB0000") +   labs(x = "User4", y = "")

gift<- ts(user13[3], frequency=24)
birthsComp <- decompose(gift)
trend_13 <-as.data.frame(birthsComp$trend)
trend_13<- trend_13 %>% mutate(counter = row_number())
ggplot(data=trend_13, aes (x=counter, y=V1))+ geom_line() + geom_vline(xintercept = c(556,739),colour="#BB0000") +   labs(x = "User4", y = "")

gift<- ts(user14[3], frequency=24)
birthsComp <- decompose(gift)
trend_14 <-as.data.frame(birthsComp$trend)
trend_14<- trend_14 %>% mutate(counter = row_number())
ggplot(data=trend_14, aes (x=counter, y=V1))+ geom_line() + geom_vline(xintercept = c(528,636),colour="#BB0000") +   labs(x = "User4", y = "")

gift<- ts(user15[3], frequency=24)
birthsComp <- decompose(gift)
trend_15 <-as.data.frame(birthsComp$trend)
trend_15<- trend_15 %>% mutate(counter = row_number())
ggplot(data=trend_15, aes (x=counter, y=V1))+ geom_line() + geom_vline(xintercept = c(660,733),colour="#BB0000") +   labs(x = "User4", y = "")


gift<- ts(user16[3], frequency=24)
birthsComp <- decompose(gift)
trend_16 <-as.data.frame(birthsComp$trend)
trend_16<- trend_16 %>% mutate(counter = row_number())
ggplot(data=trend_16, aes (x=counter, y=V1))+ geom_line() + geom_vline(xintercept = c(607,788),colour="#BB0000") +   labs(x = "User4", y = "")


gift<- ts(user17[3], frequency=24)
birthsComp <- decompose(gift)
trend_17 <-as.data.frame(birthsComp$trend)
trend_17<- trend_17 %>% mutate(counter = row_number())
ggplot(data=trend_17, aes (x=counter, y=V1))+ geom_line() + geom_vline(xintercept = c(626,894),colour="#BB0000") +   labs(x = "User4", y = "")

gift<- ts(user18[3], frequency=24)
birthsComp <- decompose(gift)
trend_18 <-as.data.frame(birthsComp$trend)
trend_18<- trend_18 %>% mutate(counter = row_number())
ggplot(data=trend_18, aes (x=counter, y=V1))+ geom_line() + geom_vline(xintercept = c(569,958),colour="#BB0000") +   labs(x = "User4", y = "")


gift<- ts(user19[3], frequency=24)
birthsComp <- decompose(gift)
trend_19 <-as.data.frame(birthsComp$trend)
trend_19<- trend_19 %>% mutate(counter = row_number())
ggplot(data=trend_19, aes (x=counter, y=V1))+ geom_line() + geom_vline(xintercept = c(415,475),colour="#BB0000") +   labs(x = "User4", y = "")

gift<- ts(user20[3], frequency=24)
birthsComp <- decompose(gift)
trend_20 <-as.data.frame(birthsComp$trend)
trend_20<- trend_20 %>% mutate(counter = row_number())
ggplot(data=trend_20, aes (x=counter, y=V1))+ geom_line() + geom_vline(xintercept = c(480,1038),colour="#BB0000") +   labs(x = "User4", y = "")




library(gridExtra)
library(ggplot2)
p4<- ggplot(data=user4, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(626,988),colour="#BB0000") +   labs(x = "User4", y = "")
p5 <- ggplot(data=user5, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(448,589),colour="#BB0000") +  labs(x = "User5", y = "")
p6 <- ggplot(data=user6, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(455,623),colour="#BB0000") +  labs(x = "User6", y = "")
p7 <- ggplot(data=user7, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(448,530),colour="#BB0000") +  labs(x = "User7", y = "")
p8 <- ggplot(data=user8, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(552,664),colour="#BB0000") +  labs(x = "User8", y = "")
p9 <- ggplot(data=user9, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(598,690),colour="#BB0000") +  labs(x = "User9", y = "")
p10 <- ggplot(data=user10, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(607,708),colour="#BB0000") +  labs(x = "User10", y = "")
p11 <- ggplot(data=user11, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(532,775),colour="#BB0000") +  labs(x = "User11", y = "")
p12 <- ggplot(data=user12, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(574,685),colour="#BB0000") +  labs(x = "User12", y = "")
p13<- ggplot(data=user13, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(556,739),colour="#BB0000") +  labs(x = "User13", y = "")
p14 <- ggplot(data=user14, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(528,636),colour="#BB0000") +  labs(x = "User14", y = "")
p15 <- ggplot(data=user15, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(660,733),colour="#BB0000") +  labs(x = "User15", y = "")
p16 <- ggplot(data=user16, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(607,788),colour="#BB0000") +  labs(x = "User16", y = "")
p17 <- ggplot(data=user17, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(626,894),colour="#BB0000") +  labs(x = "User17", y = "")
p18 <- ggplot(data=user18, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(569,958),colour="#BB0000") +  labs(x = "User18", y = "")
p19 <- ggplot(data=user19, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(415,475),colour="#BB0000") +  labs(x = "User19", y = "")
p20 <- ggplot(data=user20, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(480,1038),colour="#BB0000") +  labs(x = "User20", y = "")




grid.arrange(p5,p9,p12,p13,p15,p16,p17,p18,p19,p20, ncol=4,top="No lights condition", bottom="bottom\nlabel", 
             left="left label", right="right label")

grid.arrange(p4,p7, p8,p14, p6,p10,p11, ncol=4,top="Lights Condition", bottom="bottom\nlabel", 
             left="left label", right="right label")

