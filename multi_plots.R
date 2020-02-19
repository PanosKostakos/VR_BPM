library(gridExtra)
p<- ggplot(data=user4, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(626,988),colour="#BB0000") +   labs(x = "User4", y = "")
p1 <- ggplot(data=user5, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(448,589),colour="#BB0000") +  labs(x = "User5", y = "")
p2 <- ggplot(data=user6, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(455,623),colour="#BB0000") +  labs(x = "User6", y = "")
p3 <- ggplot(data=user7, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(455,623),colour="#BB0000") +  labs(x = "User7", y = "")
p4 <- ggplot(data=user8, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(552,664),colour="#BB0000") +  labs(x = "User8", y = "")
p5 <- ggplot(data=user9, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(598,690),colour="#BB0000") +  labs(x = "User9", y = "")
p6 <- ggplot(data=user10, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(607,708),colour="#BB0000") +  labs(x = "User10", y = "")
p7 <- ggplot(data=user11, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(532,775),colour="#BB0000") +  labs(x = "User11", y = "")
p8 <- ggplot(data=user12, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(574,685),colour="#BB0000") +  labs(x = "User12", y = "")
p9 <- ggplot(data=user13, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(556,739),colour="#BB0000") +  labs(x = "User13", y = "")
p10 <- ggplot(data=user14, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(528,636),colour="#BB0000") +  labs(x = "User14", y = "")
p11 <- ggplot(data=user15, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(660,733),colour="#BB0000") +  labs(x = "User15", y = "")
p12 <- ggplot(data=user16, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(607,788),colour="#BB0000") +  labs(x = "User16", y = "")
p13 <- ggplot(data=user17, aes (x=counter, y=value)) + geom_line() + geom_vline(xintercept = c(626,894),colour="#BB0000") +  labs(x = "User17", y = "")


grid.arrange(p,p1,p2,p3,p4,p5,p6,p7, p8,p9,p10,p11,p12,p13,ncol=4,top="top label", bottom="bottom\nlabel", 
             left="left label", right="right label")
