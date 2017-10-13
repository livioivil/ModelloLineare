#' A customization of pairs function
#' 
#' @title A customization of pairs function
#' @name pairsSigmaPsi
#' @aliases pairsSigmaPsi
#' @param X a matrix or data.frame
#' @examples 
#' pairsSigmaPsi(matrix(rnorm(300),100,3))
##' @return NULL
##'
##' @author Gianmarco Altoè, Laura Boscaro, Marta Bagno
##' @export
pairsSigmaPsi <- function(X,...){
  pairs(X,col=2,pch=20,
        lower.panel = panel.smooth, 
        upper.panel = panel.cor,
        diag.panel = panel.hist,...)
}