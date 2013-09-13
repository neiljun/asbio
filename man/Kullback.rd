\name{Kullback}
\alias{Kullback}
\alias{print.kback}

\title{Kullback test for equal covariance matrices.}
\description{
Provides Kullback's (1959) test for multivariate homoscedasticity.
}
\usage{
Kullback(Y, X)

}
\arguments{
  \item{Y}{An \emph{n} x \emph{p} matrix of quantitative variables}
  \item{X}{An \emph{n} x 1 vector of categorical assignments (e.g. factor levels)}
}
\details{
Multivariate general linear models assume equal covariance matrices for all 
factor levels or factor level combinations. Legendre and Legendre (1998) recommend 
this test for verifying homoscedsticiy.  \emph{P}-values concern a null hypothesis of 
equal population covariance matrices.  \emph{P}-values from the test are conservative with respect to type I error. 
}
\value{
Returns a dataframe with the test statistic (which follows a chi-square distribution if H\eqn{_0} is true), 
the chi-square degrees of freedom, and the calculated \emph{p}-value.  Invisible objects include the within group dispersion matrix.
}
\references{
Kullback, S. (1959)  \emph{Information theory and statistics}.  John Wiley and Sons.

Legendre, P, and Legendre, L.  (1998) \emph{Numerical ecology, 2nd English edition}.  Elsevier, 
Amsterdam, The Netherlands. 
}
\author{Pierre Legendre is the author of the most recent version of this function asbio ver >= 1.0. Stephen Ousley discovered an error in the original code. Ken Aho was the author of the original function}

\examples{
Y1<-rnorm(100,10,2)
Y2<-rnorm(100,15,2)
Y3<-rnorm(100,20,2)
Y<-cbind(Y1,Y2,Y3)
X<-factor(c(rep(1,50),rep(2,50)))
Kullback(Y,X)
}

\keyword{multivariate}
\keyword{htest}
