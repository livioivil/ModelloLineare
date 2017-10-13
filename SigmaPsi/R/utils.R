# #' @name addBreak
# #' @title addBreak add a break (e.g. \n) each given distance
# #' @param x string or vector of strings
# #' @param max.width =10 by default 
# #' @param break_string "\n" by default
# #' @export
# #' 
# addBreak<-function(x,max.width=10,break_string="\\n"){
#   if(length(x)>1){ 
#     return(sapply(x,addBreak,max.width,break_string))
#   } else{
#     n=nchar(x)
#     limits=c(seq(1,n-1,by=max.width),n+1)
#     cuted=sapply(1:(length(limits)-1),function(i)
#       substr(x, start=limits[i], stop=(limits[i+1]-1))
#     )
#     return(paste(cuted,collapse=break_string))
#   }
# }
# 

#' rowSums and rowMeans with a slight modification
#' 
#' @aliases rowSums.bylist
#' @aliases rowSums.bylist
#' @title rowSums and rowMeans performed for each element of a list and with a slight modification
##' @return a data.frame of dimension ncol(items)Xlength(ids)
##'
##' @author Livio Finos
##' @export rowSums.bylist rowMeans.bylist
rowSums.bylist <- function(items,ids){
  data.frame(lapply(ids,function(id) 
    rowMeans(items[,id],na.rm=TRUE)*length(id)) )
}

rowMeans.bylist <- function(items,ids){
  data.frame(lapply(ids,function(id) 
    rowMeans(items[,id],na.rm=TRUE)) )
}