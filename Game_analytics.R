data <- read.csv("data_BMP/questionnair/data", sep = "\t")
library("MASS")
library(effsize)
library(varhandle)
library("trend")
library(dplyr)
library(readr)
library(gridExtra)


options(scipen=999)

#Game analytics t-tests

data$Avg.speed..m.s.<-as.numeric(gsub(",", ".", gsub("\\.", "", data$Avg.speed..m.s.)))
Ga<- data%>% filter(Group == "A")
Gb<- data%>% filter(Group == "B")

#completion time  
comp_a<- Ga$Completion.time..s. 
comp_b<- Gb$Completion.time..s.
var.test(comp_a,comp_b)
t.test(comp_a,comp_b,var.equal=T)
t.test(comp_a,comp_b,alternative= 'l',var.equal=T)


#walking distance
walk_a<- Ga$Walk.distance..m.
walk_b<- Gb$Walk.distance..m.
var.test(walk_a,walk_b)
t.test(walk_a,walk_b,var.equal=T)
t.test(walk_a,walk_b,alternative= 'l',var.equal=T)



#speed
speed_a<- Ga$Avg.speed..m.s.
speed_b<- Gb$Avg.speed..m.s.
var.test(speed_a,speed_b)
t.test(speed_a, speed_b, var.equal=F)
t.test(speed_a,speed_b,alternative= 'l',var.equal=F)


#stops
stop_a<- Ga$Number.of.stops
stop_b<- Gb$Number.of.stops
var.test(stop_a,stop_b)
t.test(stop_a, stop_b, var.equal=F)
t.test(stop_a, stop_b,alternative= 'l',var.equal=F)


#rotations
turns_a<- Ga$Number.of.rotations..45.deg.turns.
turns_b<- Gb$Number.of.rotations..45.deg.turns.
var.test(turns_a,turns_b)
t.test(turns_a, turns_b, var.equal=T)
t.test(turns_a, turns_b,alternative= 'l',var.equal=T)



#Ambulance found
goal_a<- Ga$Ambulance.time
goal_b<- Gb$Ambulance.time
var.test(goal_a,goal_b)
t.test(goal_a, goal_b, var.equal=F)



#plot
png("100kHighRes300dpi.png", units="px", width=3000, height=1600, res=300)

par(mfrow=c(2,3), mgp=c(2,1,0),mai=c(0.3,0.4,0.2,0.1))



boxplot(comp_a, comp_b, names = c("CG","EG"),
        ylab ="Compl. time", main= "A", xlab ="Group",cex.lab = 1,cex.axis= 0.7)


boxplot(walk_a, walk_b, names = c("CG","EG"), 
        ylab ="Walk dist.",main= "B", xlab ="Group",cex.lab = 1,cex.axis= 0.7)


boxplot(speed_a, speed_b, names = c("CG","EG"), 
        ylab ="Avr. speed",main= "C", xlab ="Group",cex.lab = 1,cex.axis= 0.7)



boxplot(stop_a, stop_b, names = c("CG","EG"), 
        ylab ="Number of Stops", main= "D",xlab ="Group",cex.lab = 1,cex.axis= 0.7)


boxplot(turns_a, turns_b, names = c("CG","EG"), 
        ylab ="Number of turns", main= "E",xlab ="Group",cex.lab = 1,cex.axis= 0.7)

boxplot(goal_a, goal_b, names = c("CG","EG"), 
        ylab ="Time to Goal", main= "F",xlab ="Group",cex.lab = 1,cex.axis= 0.7)


dev.off()
