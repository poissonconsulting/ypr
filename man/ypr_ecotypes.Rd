% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ecotypes.R
\name{ypr_ecotypes}
\alias{ypr_ecotypes}
\title{Create Ecotypes Object}
\usage{
ypr_ecotypes(..., names = NULL)
}
\arguments{
\item{...}{These dots are for future extensions and must be empty.}

\item{names}{A character vector of unique ecotype names.}
}
\value{
An \code{\link[=ypr_ecotypes]{ypr_ecotypes()}} objects
}
\description{
Creates an ypr_ecotypes object.
}
\examples{
ypr_ecotypes(Linf = c(1, 2))
ypr_ecotypes(Linf = c(1, 2), t0 = c(0, 0.5))
}
\seealso{
Other ecotypes: 
\code{\link{as_ypr_ecotypes}()}
}
\concept{ecotypes}
