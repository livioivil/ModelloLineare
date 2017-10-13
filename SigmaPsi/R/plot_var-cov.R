##' Funzioni utili per pairs.sigmapsy
##' @title Funzioni utili per pairs.sigmapsy
##' @param x an object
##' @param y an object
##' @param digits  2 
##' @param prefix  ""
##' @param cex.cor an object
##' @param ... an object
##' @return NULL
##'
##' @author Laura Boscaro, Marta Bagno
##' @export


panel.hist <- function(x, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(usr[1:2], 0, 1.5) )
  h <- hist(x, plot = FALSE)
  breaks <- h$breaks; nB <- length(breaks)
  y <- h$counts; y <- y/max(y)
  rect(breaks[-nB], 0, breaks[-1], y, ...)
}
panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- abs(cor(x, y,use="pai")) 
  txt <- format(c(r, 0.123456789), digits = digits)[1]
  txt <- paste(prefix, txt)
  if(missing(cex.cor)) cex.cor <- 1/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex.cor)
}
