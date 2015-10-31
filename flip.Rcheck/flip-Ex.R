pkgname <- "flip"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('flip')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("flip-package")
### * flip-package

flush(stderr()); flush(stdout())

### Name: flip-package
### Title: The library is devoted to permutation-based inferential methods.
### Aliases: flip-package
### Keywords: package

### ** Examples


Y=data.frame(matrix(rnorm(50),10,5))
names(Y)=LETTERS[1:5]
Y[,1:2]=Y[,1:2]
x=rep(0:1,5)
data=data.frame(x=x, Z=rnorm(10))
res = flip(Y+matrix(x*2,10,5),~x,~Z,data=data)
res

plot(res)

p2=npc(res,"fisher",subsets=list(c1=c("A","B"),c2=names(Y)))
p2



cleanEx()
nameEx("flip")
### * flip

flush(stderr()); flush(stdout())

### Name: flip
### Title: The main function for univariate and multivariate testing under
###   a permutation (and rotation) framework + some utilities.
### Aliases: flip flip.statTest orthoZ
### Keywords: htest

### ** Examples

Y=matrix(rnorm(50),10,5)
colnames(Y)=LETTERS[1:5]
Y[,1:2]=Y[,1:2] +2
res = flip(Y)
res
plot(res)

X=rep(0:1,5)
Y=Y+matrix(X*2,10,5)

data=data.frame(Y,X=X, Z=rnorm(10))
#testing dependence among Y's and X
(res = flip(Y,~X,data=data))
#same as:
#res = flip(A+B+C+D+E~X,data=data)


#testing dependence among Y's and X, also using covariates
res = flip(Y,~X,~Z,data=data)
res
#Note that 
#flip(Y,X=~X,Z=~1,data=data)
#is different from
#flip(Y,~X,data=data)
#since the former is based on orthogonalized residuals of Y and X by Z.

## Not run: 
##D #Rotation tests:
##D rot=flip(Y,X,Z=~1,testType="rotation") 
##D # note the use Z=~1.
## End(Not run)

#Using rank tests:
res = flip(Y,~X,data=data,statTest="Wilcoxon")
res

#testing symmetry of Y around 0
Y[,1:2]=Y[,1:2] +2
res = flip(Y)
res
plot(res)


#use of strata (in this case equal to paired samples)
data$S=rep(1:5,rep(2,5))
#paired t
flip(A+B+C+D+E~X,data=data,statTest="t",Strata=~S)
#signed Rank test
flip(A+B+C+D+E~X,data=data,statTest="Wilcox",Strata=~S)

# tests for categorical data
data=data.frame(X=rep(0:2,10))
data=data.frame(X=factor(data$X),Y=factor(rbinom(30,2,.2+.2*data$X)))
flip(~Y,~X,data=data,statTest="chisq")
# separated chisq (Finos and Salmaso, 2004. Nonparametric multi-focus analysis 
# for categorical variables. CommStat - T.M.)
(res.sep=flip(~Y,~X,data=data,statTest="chisq.separated"))
npc(res.sep,"sumT2") #note that combined test statistic is the same as chisq

## Not run: 
##D # User-defined test statistic:
##D my.fun <- function(Y){
##D   summary(lm(Y~X))$coeff[1,"Pr(>|t|)"]
##D }
##D X<- matrix(rep(0:2,10))
##D Y <- matrix(rnorm(30))
##D flip(Y=Y,X=X,statTest=my.fun)
## End(Not run)



cleanEx()
nameEx("flip.object-class")
### * flip.object-class

flush(stderr()); flush(stdout())

### Name: flip.object-class
### Title: Class "flip.object" (and related functions) for storing the
###   result of the function flip and flipMix
### Aliases: draw p.value plot size result getFlip cFlip flip.object-class
###   [,flip.object-method [,flip.object,ANY,ANY,ANY-method
###   [[,flip.object-method hist,flip.object-method
###   length,flip.object-method names,flip.object-method
###   names<-,flip.object-method p.value,flip.object-method
###   plot,flip.object-method result,flip.object-method
###   show,flip.object-method size,flip.object-method
###   sort,flip.object-method summary,flip.object-method
###   p.adjust,flip.object-method numericOrmatrixOrNULL-class
###   arrayOrNULL-class data.frameOrNULL-class numericOrmatrixOrNULL
###   arrayOrNULL data.frameOrNULL
### Keywords: classes

### ** Examples

showClass("flip.object")

y=matrix(rnorm(50),10,5)
colnames(y)=c("X1","X2","Y1","Y2","Y3")
res=flip(y)

## Sort by p-values
sort(res)

## Selecting tests
res[1:2]
#same as
res["X"]
#different from (it selects tests having "1" or "2" in the name)
res[c("1","2")]

## Concatenates two flip-objects
cFlip(res[1:2],res[5])


#plotting results
plot(flip(y))

#Get any slot of the flip-object. eg the permutation space:
head(getFlip(res,"permT"))
#Get any element of the list obj@data. eg Y:
getFlip(res,"Y")
#Get any columns of the results table: obj@res. eg Statistic (choose among colnames(obj@res) ):
getFlip(res,"Stat")



cleanEx()
nameEx("flipMix")
### * flipMix

flush(stderr()); flush(stdout())

### Name: flipMix
### Title: The main function for testing mixed models under a permutation
###   (and rotation) framework
### Aliases: flipMix flipMixWithin obs2coeffWithin
### Keywords: htest

### ** Examples

N=10
toyData= data.frame(subj=rep(1:N,rep(4,N)), Within=rep(1:2,N*2),
          XBetween= rep(1:2,rep(N/2*4,2)),ZBetween= rep(rnorm(N/2),rep(8,N/2)))
toyData= cbind(Y1=rnorm(n=N*4,mean=toyData$subj+toyData$ZBetween+toyData$XBetween),
               Y2=rnorm(n=N*4,mean=toyData$subj+toyData$ZBetween+toyData$Within*2),toyData)
(toyData)

#####################
###Testing Between-unit effects
(res=flipMix(modelWithin=as.matrix(toyData[,c("Y1","Y2")])~Within,data=toyData, 
      X=~XBetween,Z=~ZBetween,units=~subj,perms=1000,testType="permutation",statTest="t"))
#same as:
modelWithin <- lm(as.matrix(toyData[,c("Y1","Y2")])~Within,data=toyData)
(flipMix(modelWithin=modelWithin,data=toyData, X=~XBetween,Z=~ZBetween,units= ~subj, 
        perms=1000,testType="permutation",statTest="t"))

### Note that this is different from:
modelWithin <- list(Y1=lm(Y1~Within,data=toyData),Y2=lm(Y2~Within,data=toyData))
(flipMix(modelWithin=modelWithin,data=toyData, X=~XBetween,Z=~ZBetween,units= ~subj,
        perms=1000,testType="permutation",statTest="t"))

### combining results
(npc(res,"data.pc"))
(npc(res,"data.trace"))
################################
###Testing Within-unit effects
## The resulting test is approximated. The estimate of the variance within units 
## takes in account the presence of effects between units.
(flipMix(modelWithin=as.matrix(toyData[,c("Y1","Y2")])~Within,data=toyData, 
        units= ~subj, perms=1000,testType="permutation",statTest="t"))

###The resulting tests are exact. If effects between are presents, 
## statTest="Tnaive" or "TBTWest" are more suitable:
(res=flipMixWithin(modelWithin=as.matrix(toyData[,c("Y1","Y2")])~Within,data=toyData, 
        units= ~subj, perms=1000,statTest=c("TH1est")))
npc(res)



cleanEx()
nameEx("multiplicity")
### * multiplicity

flush(stderr()); flush(stdout())

### Name: npc
### Title: Functions for multiplicity corrections
### Aliases: npc flip.adjust flip.npc.methods
### Keywords: htest

### ** Examples


Y=data.frame(matrix(rnorm(50),10,5))
names(Y)=LETTERS[1:5]
Y[,1:2]=Y[,1:2]+1.5
res = flip(Y,perms=10000)

########npc
p2=npc(res) # same as p2=npc(res,"Fisher")
summary(p2)
p2=npc(res,"minP")
summary(p2)
p2=npc(res,"Fisher",subsets=list(c1=c("A","B"),c2=names(Y)))
summary(p2)
p2=npc(res,"Fisher",subsets=list(c1=c("A","B"),c2=names(Y)),weights=1:5)
summary(p2)



res=flip.adjust(res,"maxT")

#res=flip.adjust(res,"BH")
##same as 
#p.adjust(res,"BH")

## now try
#getFlip(res,"Adjust")



cleanEx()
nameEx("permutationSpace")
### * permutationSpace

flush(stderr()); flush(stdout())

### Name: permutationSpace
### Title: These functions handle the orbit of permutation/rotation tests
###   (i.e. permutation/rotation space).
### Aliases: permutationSpace make.permSpace make.signSpace allpermutations
###   npermutations t2p rom romFast
### Keywords: manip

### ** Examples

#10 random elements of the orbit of a one-sample test
make.signSpace(5, 10)

#All elements of the orbit of a one-sample test (the size of the space is 2^5 < 1000)
make.signSpace(5, 1000)

## Not run: 
##D #A random rotation matrix of size 3
##D (r=rom(3))
##D #verify that it is orthogonal:
##D r##D 
## End(Not run)



### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
