\name{MC.test}
\Rdversion{1.1}
\alias{MC.test}
\title{
Monte Carlo hypothesis testing for two samples.
}
\description{\code{MC.test} calculates a permutation of test statistics from an pooled variance \emph{t}-test.  It compares this distribution to an initial test statistic calculated using non-permuted data to derive a \emph{P}-value.}
\usage{
MC.test(Y,X, perm = 1000, alternative = "not.equal", var.equal = TRUE, paired = FALSE)
}
\arguments{
  \item{Y}{
Response data.
}
  \item{X}{
Categorical explanatory variable.
}
  \item{perm}{
Number of iterations.
}
\item{var.equal}{Logical: Should equal variances be assumed?}

\item{paired}{Logical: Are sample paired?}

  \item{alternative}{
Alternative hypothesis.  One of three options: \code{"less","greater"}, or \code{"not.equal"}.  These provide lower-tail, upper-tail, and two-tailed tests.
}
}
\details{
The method follows the description of Manly (1998) for a two-sample test.  Upper and lower tailed tests are performed by finding the portion of the distribution greater than or equal to the observed \emph{t} test statistic (upper-tailed) or less than or equal to the observed test statistic (lower-tailed). A two tailed test is performed by multiplying the portion of the null distribution above the absolute value of the observed test statistic by two.  Results from the test will be similar to \code{oneway_test} from the library \code{coin} since it is based on an equivalent test statistic.  The function \code{ oneway_test} allows additional options including blocking. 
}
\value{
Returns a list with the following items:
\item{observed.test.statistic}{\emph{t}-statistic calculated from non-permuted (original)data.}
\item{no_of_permutations_exceeding_observed_value}{The number of times a Monte Carlo derived test statistic was more extreme than the initial observed test statistic.}
\item{p.value}{Empirical \emph{P}-value}
\item{alternative}{The alternative hypothesis}
}
\references{
Manly, B. F. J. (1997) \emph{Randomization and Monte Carlo Methods in Biology, 2nd edition}.  Chapman and Hall, London.
}
\author{Ken Aho}
\seealso{\code{\link{t.test}}}
\examples{
Y<-c(runif(100,1,3),runif(100,1.2,3.2))
X<-factor(c(rep(1,100),rep(2,100)))
MC.test(Y,X,alternative="less")
}
\keyword{htest}
\keyword{univar}

