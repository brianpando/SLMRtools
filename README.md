# SLMRtools
Tools for help in Sistematyc Review and Mapping Literature.


Dependencies: library(devtool), library(ggplot2)

INSTALL: devtools::install_github('brianpando/SLMRtools')

Load the Library: library("SLMRtools")

Functions: 
 * bubble2sides: Example:
 <code>data<- data.frame( x=c(-7,-7,-7,-7,-7,-6,-6,-6,-5,-5,-5, -4,-4, -3,-3,-3,-3, -2,-2,-2,-2,-2,-2, -1,-1,-1, 3,3,3,3,3,3, 6,6,6,6,6), y=c(1,3,4,2,5, 1,3,2, 1,3,2, 6,1, 1,3,2,5, 6,1,3,4,2,5, 1,3,5, 1,2,3,4,5,6, 1,2,3,4,5 ), coverage=c(7,1,2,2,2, 1,2,1, 17,2,3, 1,1, 6,2,3,1, 1,40,11,4,7,1, 4,2,2, 12,2,4,2,1,1, 63,23,16,6,4), product=c("AWS", "AWS","AWS","AWS","AWS","AZURE","AZURE","AZURE","DOCKER","DOCKER","DOCKER","GITHUB","GITHUB","GITLAB","GITLAB","GITLAB","GITLAB","JENKINS","JENKINS","JENKINS","JENKINS","JENKINS","JENKINS","TRAVIS","TRAVIS","TRAVIS","AC","AC","AC","AC","AC","AC", "IND", "IND", "IND", "IND", "IND") ) 
ggplot(data) + theme_2side_buble(data$x,data$y, ticks=14, color = 'darkgray' , ylab='Programming Language', xlab='Context', x2lab='Tool', ylabels = c('Java','Python','JS','PHP','Ruby','C'), xlabels = c('AWS','Azure','Docker','Github','Gitlab','Jenkins','Travis'), x2labels = c('','','Academy','','','Industry','')  )+
  geom_point(aes(x = x, y = y, size=coverage, color=product, alpha=0.1)) + 
  geom_text(aes(x = x, y = y,label=coverage), size=5, nudge_x=0.0, nudge_y=-0.15) +
  scale_size(range=c(2,20), breaks=c(20,60))+
  theme(legend.position = 'none') </code>
