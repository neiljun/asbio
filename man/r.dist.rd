\name{r.dist}
\alias{r.dist}
\alias{see.r.dist.tck}

\title{
Visualize the sampling distribution of Pearson's product moment correlation
}
\description{
A stumbling point for many methods of inference for true correlation and independence is the 1) assymetry, 2) bounded nature, and 3) dependence on sample size of the sampling distribution of r.  
These functions allow visualization of these characteristics.  The equation here is based on the first two steps in an asympotic series (see Kenney and Keeping 1951).    
}
\usage{
r.dist(rho, r, n)
see.r.dist.tck()
}
\arguments{
  \item{rho}{
Population correlation
}
  \item{r}{
A numeric vector containing possible estimates of \eqn{rho}.
}
  \item{n}{
Sample size, an integer.
}

}
\details{
All distributions are standardized to have an area of one.
}
\references{
Kenney, J. F. and E. S. Keeping (1951) \emph{Mathematics of Statistics, Pt. 2, 2nd ed}. Van Nostrand, Princeton, NJ. 

Weisstein, E. W. (2012) Correlation Coefficient--Bivariate Normal Distribution. From MathWorld--A Wolfram Web Resource. http://mathworld.wolfram.com/CorrelationCoefficientBivariateNormalDistribution.html 
}
\author{
Ken Aho
}
\seealso{
\code{\link{cor}}
}
\examples{
dev.new(height=3.5)
par(mfrow=c(1,2), mar=c(4,4,0,0.5))
vals <- r.dist(0.9, seq(-1, 1, .001), 5)
plot(seq(-1, 1, .001), vals, type = "l",ylab = "f(r)", xlab = "r")
vals <- r.dist(0.5, seq(-1, 1, .001), 5)
lines(seq(-1, 1, .001), vals, lty = 2)
vals <- r.dist(0.0, seq(-1, 1, .001), 5)
lines(seq(-1, 1, .001), vals, lty = 3)
legend("topleft", lty = c(1, 2, 3), title = "n = 5", legend = c(expression(paste(rho, " = 0.9")),expression(paste(rho, " = 0.5")),expression(paste(rho, " = 0"))),bty = "n") 

vals <- r.dist(0.9, seq(-1, 1, .001), 30)
plot(seq(-1, 1, .001), vals, type = "l",ylab = "f(r)", xlab = "r")
vals <- r.dist(0.5, seq(-1, 1, .001), 30)
lines(seq(-1, 1, .001), vals, lty = 2)
vals <- r.dist(0.0, seq(-1, 1, .001), 30)
lines(seq(-1, 1, .001), vals, lty = 3)
legend("topleft", lty = c(1, 2, 3), title = "n = 30", legend = c(expression(paste(rho, " = 0.9")),expression(paste(rho, " = 0.5")),expression(paste(rho, " = 0"))), bty = "n") 
}

\keyword{graphs}

