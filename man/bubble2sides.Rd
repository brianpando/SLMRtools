\name{bubble2sides}
\alias{b2s}
\title{Bubble 2 sides plot}
\usage{
bubble2sides(xvals,yvals,xgeo, yg,cl,si,xl,x2l,yl,yls,xls,x2ls,ts,tx,xli,yli,ep)
}
\description{
create a Bubble 2 sides plot.
Dependencies: ggplot2, ggthemes.
Example:
data<- data.frame( x=c(-2,2), y=c(2,2), coverage=c(7,2), product=c("AWS","AZURE","A", "B") )
ggplot(data) + bubble2sides(x=data$x ,y=data$y, ticks=4,ylab='Languages', xlab='Contexts', x2lab='Tools', ylabels = c('R','Python'), xlabels = c('AWS','Azure'), x2labels = c('A','B')) +
  geom_point(aes(x = x, y = y, size=coverage, color=product, alpha=0.1)) +
  geom_text(aes(x = x, y = y,label=coverage), size=5, nudge_x=0.0, nudge_y=-0.15) +
  scale_size(range=c(2,20), breaks=c(20,60))+
  theme(legend.position = 'none')

}
\examples{
library(ggplot2)
ggplot(data.frame(x=c(1)))+bubble2sides(c(1),c(1))
}
