#'@title logit
#'@aliases expit
#'@param x value or vector of values
#'@description logit and expit (its inverse) functions
#'@export logit expit

logit <- function(x) log(x/(1-x))
expit <- function(x) exp(x)/(1+exp(x))