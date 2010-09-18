\name{anm.die}
\alias{anm.die}
\alias{anm.die.tck}

\title{
Animated depiction of six-sided die throws.
}
\description{
Convergence in probablity for fair (or loaded) six-sided die.
}
\usage{

anm.die(reps = 300, interval = 0.1, show.die = TRUE, p = c(1/6, 1/6, 1/6, 
1/6, 1/6, 1/6))

anm.die.tck()
}
\arguments{
  \item{reps}{Number of die throws.
}
  \item{interval}{
Animation interval in frames per second.
}
  \item{show.die}{
Logical, indicating whether die outcomes should be shown
}
  \item{p}{
A vector of length six which sums to one indicating the probability of die outcomes
}
}
\author{
Ken Aho
}
\seealso{
\code{\link{anm.coin}}}
\examples{
\dontrun{
anm.die()
}
}
\keyword{graphs}
