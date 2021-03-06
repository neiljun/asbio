\name{Venn}
\alias{Venn}
\alias{Venn.tck}

\title{Venn probability diagrams for an event with two outcomes}
\description{
The user specifies the probabilities of two outcomes, and if applicable, their intersection.  A Venn diagram is returned. The universe, S, will generally not have unit area, but in many applications will be a good approximation.  The area of the intersection will also be an approximation.   
}
\usage{
Venn(A, B, AandB = 0, labA = "A", labB = "B", cex.text = .95, ...)

Venn.tck()
}
\arguments{
  \item{A}{Probability of event A}
  \item{B}{Probability of event B}
  \item{AandB}{Probability of the intersection of A and B}
  \item{labA}{Label assigned to event A in the diagram}
  \item{labB}{Label assigned to event B in the diagram}
  \item{cex.text}{Character expansion for text.}
  \item{\dots}{Additional arguments from \code{\link{plot}}}
}
\value{
A Venn diagram is returned.  
}
\references{Bain, L. J., and M. Engelhardt (1992)  \emph{Introduction to Probability and Mathematical 
Statistics}.  Duxbury press.  Belmont, CA, USA.
}
\author{K. Aho}
\examples{
Venn(A=.3,B=.2,AandB=.06)
}
\keyword{graphs}

