#'@title plotXresid
#'@param mod lm model
#'@param x name of the term to be ploted
#'@description plot x vs residual of an lm model
#'@export
plotXresid <- function(mod,x){
  plot(mod$model[,x],residuals(mod))
  abline(0,0,col="red")
}
