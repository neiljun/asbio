\name{prp}
\alias{prp}
\alias{print.prp.index}
\title{
Perpindicularity}
\description{
Calculates a perpindicularity index, \eqn{eta} for animal spatial movements.  The index has a [0, 1] range with 0 indicating a perfectly parallel movement with repsect to boundary or edge and 1 indicating perfectly perpindicular movement.  Other summaries are also provided.
}
\usage{

prp(Time, S.X, S.Y, N.X, N.Y, habitat = NULL, near.angle = NULL, F.0.NA = TRUE)
}
\arguments{

  \item{Time}{
A numeric vector containing the times when spatial coordinates were recorded.
}
  \item{S.X}{
\emph{X}-coordinates of animal.
}
  \item{S.Y}{
\emph{Y}-coordinates of animal.
}
  \item{N.X}{
\emph{X}-coordinate of nearest point on boundary.  These data are easily obtained from FRAGSTATS.
}
  \item{N.Y}{
\emph{Y}-coordinate of nearest point on boundary.  These data are easily obtained from FRAGSTATS.
}
  \item{habitat}{
A character vector of habitat categories.
}
  \item{near.angle}{
A numeric vector containing the angle of azimuth to the nearest point on the boundary with respect to a four quadrant system.  NE = \eqn{0^o} to \eqn{90^o}, NW is > \eqn{90^o} and \eqn{\le 180^o}, SE is < \eqn{0^o} and \eqn{\le - 90^o} is > \eqn{-90^o} and \eqn{\le -180^o}.  This output readily obtained from ARCGIS software.
}
  \item{F.0.NA}{
A logical argument specifying whether or not a time interval in which F = 0 should be made \code{NA} (see Figure from examples)
}
}
\details{
This index for perpindicularity, \eqn{\eta} is based on the following rules:

if \eqn{\delta \le 90^o} then \eqn{\eta} = \eqn{\delta/90^o}; if \eqn{90^o < \delta \le 135^o} then \eqn{\eta} = \eqn{[90^o - (\delta - 90^o)]/90^o}; if \eqn{135^o < \delta \le 180^o} then \eqn{\eta} = \eqn{(\delta - 90^o)/90^o} 

For notation create the Figure in the examples.
}
\value{
Returns a list with 3 or four items.

\item{lines}{A matrix with \emph{n} - 1 rows containing line lengths for the lines \emph{A, B, C, D, and F}.  See figure in examples below}.
\item{angles}{A matrix with \emph{n} - 1 rows containing line lengths for the angles \eqn{\kappa}, \eqn{\gamma} and \eqn{\delta}.  See figure in examples below.}
\item{moment.by.moment}{This component provides a matrix with \emph{n} - 1 rows.  Included are the columns: \code{End.time}, \code{Eta.Index}, \code{Delta}, \code{Habitat}, and \code{Brdr chng}.  The columns \code{Habitat}, and \code{Brdr chng} are excluded if \code{habitat = NULL} or \code{near.angle = NULL}}
\item{P.summary}{Contains averages and standard errors for \eqn{\eta}.}
\item{crossing.summary}{Crossing binomial summaries.  Provided if \code{habitat} and \code{near.angle} are specified.}
}
\references{
Kie, J.G., A.A. Ager, and R.T. Bowyer  (2005)  Landscape-level movements of North American 
elk (\emph{Cervus elaphus}): effects of habitat patch structure and topography. \emph{Landscape Ecology} 20:289-300.

McGarigal K., SA Cushman, M.C. Neel, and E. Ene  (2002) \emph{FRAGSTATS: Spatial Pattern
Analysis Program for Categorical Maps}. Computer software program produced by the
authors at the University of Massachusetts, Amherst.

}
\author{
Ken Aho
}

\examples{

###Diagram describing prp output.  
y<-rnorm(100,0,5)
plot(seq(1,100),sort(y),type="l",xaxt="n",yaxt="n",lwd=2,xlab="",ylab="")
par(font=3)

segments(52,-12,46,sort(y)[46],lty=1,col=1,lwd=1)##A
segments(90,-8,85,sort(y)[85],lty=1,col=1,lwd=1)##B
segments(46,sort(y)[46],85,sort(y)[85],lty=1)##F
segments(90,-8,46,sort(y)[46],lty=2)##D
arrows(52,-12,90,-8,length=.1,lwd=3)##C
arrows(20,-12,20,8,lty=2,col="gray",length=.1)##N
arrows(20,sort(y)[46],95,sort(y)[46],length=.1,lty=2,col="gray")
arrows(20,-12,95,-12,length=.1,lty=2,col="gray")

text(20,9,"N",col="gray");text(97,-12, "E", col= "gray");text(97,sort(y)[46], "E", col= "gray")
text(49.5,-12.5,"a");text(92.5,-8.5,"b")
text(45.5,-5.5,"A",font=4,col=1);text(70,-9,"C",font=4,col=1);text(91.5,-1.75,"B",font=4,col=1)
text(44,sort(y)[46]+1,"c");text(67.5,-2.5,"D",font=4,col=1);text(65,3.9,"F",font=4,col=1)
text(87,sort(y)[87]+1,"d");text(57,-10,expression(kappa),col=1);
text(81,sort(y)[87]-3,expression(gamma),col=1);text(57,1.3,expression(theta),col=1)
text(64,-11.5,expression(beta),col=1)

library(plotrix)
draw.arc(50,-12,6,1.35,col=1);draw.arc(50,-12,6,.3,col=1);draw.arc(50,-12,6,0.02,col=1)
draw.arc(46,sort(y)[46],7,.01,col=1);draw.arc(46,sort(y)[46],7,.5,col="white")
draw.arc(85,sort(y)[85],6,-2.7,col=1);draw.arc(85,sort(y)[85],6,-1.4,col="white",lwd=2)
legend("topleft",c(expression(paste(kappa, " = acos[(",C^2," + ",X^2," - ",D^2,")/2CX]")),
expression(paste(gamma," = acos[(",Y^2," + ",F^2," - ",D^2,")/2YF]")),
expression(paste(theta," = atan[(",y[f]," - ",y[n],")/(",x[f]," - ",x[n],")]")),
expression(paste(beta, " = atan[(",y[epsilon]," - ",y[alpha],")/(",x[epsilon]," - ",x[alpha],")]"))),
bty="n",cex=.9,inset=-.025)
###Figure for demo dataset.
X<-seq(0,49)/46

Y<-c(4.89000,4.88200,4.87400,4.87300,4.88000,4.87900,4.87900,4.90100,4.90800,
4.91000,4.93300,4.94000,4.91100,4.90000,4.91700,4.93000,4.93500,4.93700,
4.93300,4.94500,4.95900,4.95400,4.95100,4.95800,4.95810,4.95811,4.95810,
4.96100,4.96200,4.96300,4.96500,4.96500,4.96600,4.96700,4.96540,4.96400,
4.97600,4.97900,4.98000,4.98000,4.98100,4.97900,4.98000,4.97800,4.97600,
4.97700,4.97400,4.97300,4.97100,4.97000)

dx<-c(0.004166667,0.108333333,0.316666667,0.525000000,0.483333333,0.608333333,
0.662500000,0.683333333,0.900000000,1.070833333)
dy<-c(4.67,4.25,4.26,4.50,4.90,4.10,4.70,4.40,4.20,4.30)

plot(X,Y,type="l",lwd=2,xlab="",ylab="",ylim=c(4,5.1))
lines(dx,dy)

for(i in 1:9)arrows(dx[i],dy[i],dx[i+1],dy[i+1],length=.1,lwd=1,angle=20)
mx<-rep(1,9)
my<-rep(1,9)
for(i in 1:9)mx[i]<-mean(c(dx[i],dx[i+1]))
for(i in 1:9)my[i]<-mean(c(dy[i],dy[i+1]))
for(i in 1:9)text(mx[i],my[i],i,font=2,cex=1.3)

euc<-function(x1,x2,y1,y2)sqrt((x1-x2)^2+(y1-y2)^2)##euclidean distance
e<-matrix(ncol=10,nrow=50)
for(i in 1:10){
e[,i]<-euc(dx[i],X,Y,dy[i])
}

mn<-apply(e,2,function(x){which(x==min(x))})
prp(seq(1,10),dx,dy,X[mn],Y[mn])$moment.by.moment
}

