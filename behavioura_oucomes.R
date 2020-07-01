library(coin)


data <- read.csv("data_BMP/questionnair/data", sep = "\t")

wilcox.test((data$I.felt.challnged)~data$Group,exact=TRUE)
kruskal.test(data$I.felt.challnged~data$Group)
median(data$I.felt.challenged)

data$Likert.f = factor(data$I.thought.it.was.hard,
                       ordered = TRUE)
wilcox.test(panos ~ vas)

#While playing
during<- lapply(data[39:85], function(x) wilcox.test(as.integer(x) ~ data$Group, alternative="two.sided", data=data))
after<-lapply(data[88:104], function(x) wilcox.test(as.integer(x) ~ data$Group, alternative="two.sided", data=data))

map(after,3)

levels(data$Group)

library("ggpubr")
ggline(data, x = "Group", y = "I.felt.revived", 
       add = c("mean_se", "jitter"), 
       order = c("A","B"))

wilcox.test(data$I.felt.bored~data$Group)
