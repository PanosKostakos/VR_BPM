data <- read.csv("data_BMP/questionnair/data", sep = "\t")
library(coin)

wilcox.test((data$I.felt.challnged)~data$Group,exact=TRUE)
kruskal.test(data$I.felt.challnged~data$Group)


# A Wilcoxon signed rank test showed that there was a significant difference (p< 0.001)
# between scores given for the old video compared to the new demonstration method. The
# median score for the new demonstration method was 22 compared to 14 for the old video.
# Therefore, the charity should start using the new method for explaining the condition to the
# general public.

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
