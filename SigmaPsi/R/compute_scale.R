#' Calcola una scala a partire dagli items
#' 
#' @title Calcola una scala a partire dagli items
#' @aliases compute.scale
#' @description Calcola una scala a partire dagli items
#' @param items a matrix o data.frame
#' @param prop.na proportion of NAs allowed before droping the observation. .20 by default
#' @param na.action how to deal NAs. "rowMeans" by default.
#' @param out.names a vector of colnames to be used in the output. "out" by default.
#' @examples 
#' DAS=compute.scale(items_DAS,prop.na=.20,
#'                   params = scale_das_params)
#'                   
#'                   summary(DAS)
#'                   pairsSigmaPsi(DAS)

##' @return NULL
##'
##' @author Livio Finos
##' @export
compute.scale <- function(items,prop.na=.20, na.action="rowMeans",
                          out.names="out",
                       params=list(invert=FALSE, 
                                       values.ranges=NULL,
                                       transf=function(items) 
                                         rowMeans(items))){


  keep=apply(items,1,function(y) mean(is.na(y)) <=prop.na)

  if(length(params$invert)>0){
    if(is.null(params$values.ranges)){
      params$values.ranges=apply(items,2,range) 
      } else if(is.null(dim(params$values.ranges))){
      params$values.ranges=matrix(params$values.ranges,2,ncol(items))
      }
    
    items[,params$invert]= 
      t(array(params$values.ranges[2,params$invert]+
                                     params$values.ranges[1,params$invert],
                          dim(items[,params$invert])[2:1]))-
                          items[,params$invert]
      }
  #check minimun number of non missing data in each row
  if(!is.null(params$na.action))
    na.action=params$na.action
  
  if(!is.na(na.action)&& !is.null(na.action)&&na.action=="rowMeans"){
    items[keep,]=t(apply(items[keep,],1,
                       function(x) {
                         x[is.na(x)]=mean(x,na.rm=TRUE)
                         x}))
                     }
  
  temp=params$transf(items[keep,])
  if(is.vector(temp)) temp=as.matrix(temp)
  out=matrix(,nrow(temp)+sum(!keep),ncol(temp),
             dimnames = list(rownames(items),colnames(temp)))
  out[keep,]=as.matrix(temp)
  if(is.null(colnames(out))){
    out.names=paste(rep(out.names,length.out=ncol(out)),sep="",
                    1:ncol(out))
  colnames(out)=out.names
  }
  data.frame(out)
}
