# Some useful keyboard shortcuts for package authoring:
# guide: https://estadistica-dma.ulpgc.es/cursoR4ULPGC/16-crearPaquetes.html
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

bubble2sides <- function(xvals, yvals, xgeo = 0, ygeo = 0,
                              color = 'darkgray', size = 0.5,
                              xlab = "x", x2lab='x2' , ylab = "y" ,
                              ylabels=c('A'),
                              xlabels=c('C'), x2labels=c('B'),
                              ticks =2,textsize = 3,
                              xlimit = max(abs(xvals)),
                              ylimit = max(abs(yvals),abs(xvals)),
                              epsilon = max(xlimit,ylimit)/50){
  #' @title This function create a 2 sides Bubble plot
  #' @description This function create a 2 sides Bubble plot
  #' devtools::install_github("brianpando/slmrtools")
  #' @param xvals Values of x that will be plotted
  #' @param yvals Values of y that will be plotted
  #' @return axis plot
  #'

  #INPUT:
  #xvals .- Values of x that will be plotted
  #yvals .- Values of y that will be plotted
  #xgeo  .- x intercept value for y axis
  #ygeo  .- y intercept value for x axis
  #color .- Default color for axis
  #size  .- Line size for axis
  #xlab  .- Label for x axis
  #ylab  .- Label for y axis
  #ticks .- Number of ticks to add to plot in each axis
  #textsize .- Size of text for ticks
  #xlimit .- Limit value for x axis
  #ylimit .- Limit value for y axis
  #epsilon .- Parameter for small space
  #Create axis
  xaxis <- data.frame(x_ax = c(-xlimit, xlimit), y_ax = rep(ygeo,2))
  yaxis <- data.frame(x_ax = rep(xgeo, 2), y_ax = c(0, ylimit))
  #Add axis
  theme.list <-
    list(
      theme_void(), #Empty the current theme
      geom_line(aes(x = x_ax, y = y_ax), color = color, size = size, data = xaxis),
      geom_line(aes(x = x_ax, y = y_ax), color = color, size = size, data = yaxis),
      annotate("text", x = (xlimit/2) - 50*epsilon, y = ygeo - 5*epsilon , label = x2lab, size = 1.2*textsize),
      annotate("text", x = (xlimit/2) + 1*epsilon, y = ygeo - 5*epsilon , label = xlab, size = 1.2*textsize),
      annotate("text", x = xgeo, y = ylimit + 4*epsilon, label = ylab, size = 1.2*textsize),
      xlim(-xlimit - 7*epsilon, xlimit + 7*epsilon), #Add limits to make it square
      ylim(-0 - 7*epsilon, ylimit + 7*epsilon)  #Add limits to make it square
    )
  #Add ticks programatically
  ticks_x <- round(seq(-xlimit, xlimit, length.out = ticks+1),2)
  ticks_y <- seq(0, length(ylabels) )
  #Add ticks of x axis
  nlist <- length(theme.list)
  xlabels_full = c( xlabels, x2labels )
  for (k in 1:ticks){
    #Create data frame for ticks in x axis
    xtick <- data.frame(xt = rep(ticks_x[k], 2), yt = c(xgeo + epsilon, xgeo - epsilon))
    #Add ticks to geom line for x axis
    theme.list[[nlist + 4*k-3]] <- geom_line(aes(x = xt, y = yt), data = xtick, size = size,  color = color)
    #Add labels to the x-ticks
    theme.list[[nlist + 4*k-2]] <- annotate("text", x = ticks_x[k], y = ygeo - 2.5*epsilon, size = textsize, label = paste(xlabels_full[k]))
  }
  for (k in 1: length(ylabels) ){
    #Create data frame for ticks in y axis
    ytick <- data.frame(xt = c(ygeo + epsilon, ygeo - epsilon),  yt = rep(ticks_y[k]+epsilon+0.5, 2))
    #Add ticks to geom line for y axis
    theme.list[[nlist + 4*k-1]] <- geom_line(aes(x = xt, y = yt), data = ytick, size = size, color = color)
    #Add labels to the y-ticks
    theme.list[[nlist+4*k]] <- annotate("text", x = xgeo - epsilon+0.2, y = ticks_y[k] +epsilon+0.7, size = textsize, label = paste(ylabels[k]))
  }
  #Add theme
  return(theme.list)
}

#ggplot(data.frame(x=c(1)))+bubble2sides(c(1),c(1),ticks=2,ylabels=c('A'),xlabels=c('B'),x2labels=c('C'))
#bubble2sides(c(1,2), c(1,2), size=c(1,2), ylabels=c('R'), xlabels=c('A'), x2labels=c('A'))
