\name{alfalfa.split.plot}
\alias{alfalfa.split.plot}
\docType{data}
\title{An agricultural split plot design}
\description{
An experiment was conducted in Iowa in 1944 to see how different varieties of alfalfa responded 
to the last cutting day of the previous year (Snedecor and Cochran 1967). We know that in the 
fall alfalfa can either continue to grow, or stop growing and store resources belowground in roots 
for growth during the following year. Thus, we might expect that later cutting dates inhibits 
growth for the following year. On the other hand, if plants are cut after they have gone into 
senescence, there should be little effect on productivity during the following year. There are 
two factors: 1) variety of alfalfa (three varieties were planted in each of three randomly chosen whole plots), 
and 2) the date of last cutting (Sept 1, Sept. 20, or Oct. 7).  The dates were randomly 
chosen split plots within the whole plots. Replication was accomplished using six blocks of fields. 
}
\usage{data(alfalfa.split.plot)}
\format{
The dataframe contains four variables: 
  \describe{
    \item{\code{yield}}{
     Alfalfa yield (tons per acre). 
    }
    \item{\code{variety}}{
      Alfalfa variety.  A factor with three levels "L"= Ladak, "C" = Cosack, and "R" = Ranger describing the variety of alfalfa seed used.
    }
    \item{\code{cut.time}}{Time of last cutting. A factor with three levels: "None" = field not cut, "S1" = Sept 1, "S20" = Sept. 20, or "O7" = Oct. 7.
          }
    \item{\code{block}}{The block (whole plot replicate).  A factor with six levels: "1", "2", "3", "4", "5", and "6".}
      }
}
\source{Snedecor, G. W. and Cochran, G. C.  (1967)  \emph{Statistical Methods, 6th edition}.  Iowa State University Press.} 
\keyword{datasets}
