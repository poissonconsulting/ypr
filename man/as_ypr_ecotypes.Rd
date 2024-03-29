% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/as-ypr-ecotypes.R
\name{as_ypr_ecotypes}
\alias{as_ypr_ecotypes}
\alias{as_ypr_ecotypes.data.frame}
\alias{as_ypr_ecotypes.ypr_population}
\alias{as_ypr_ecotypes.ypr_populations}
\alias{as_ypr_ecotypes.ypr_ecotypes}
\title{Coerce to an Ecotypes Object}
\usage{
as_ypr_ecotypes(x, ...)

\method{as_ypr_ecotypes}{data.frame}(x, ...)

\method{as_ypr_ecotypes}{ypr_population}(x, ...)

\method{as_ypr_ecotypes}{ypr_populations}(x, ...)

\method{as_ypr_ecotypes}{ypr_ecotypes}(x, ...)
}
\arguments{
\item{x}{The object to coerce.}

\item{...}{Additional arguments.}
}
\value{
An object of class ypr_ecotypes.
}
\description{
Coerce to an Ecotypes Object
}
\section{Methods (by class)}{
\itemize{
\item \code{as_ypr_ecotypes(data.frame)}: Coerce a data.frame to an Ecotypes Object

\item \code{as_ypr_ecotypes(ypr_population)}: Coerce a Population Object to an Ecotypes Object

\item \code{as_ypr_ecotypes(ypr_populations)}: Coerce a Populations Object to an Ecotypes Object

\item \code{as_ypr_ecotypes(ypr_ecotypes)}: Coerce an Ecotypes Object to an Ecotypes Object

}}
\examples{
as_ypr_ecotypes(as.data.frame(ypr_ecotypes(Ls = c(10, 15, 20))))
as_ypr_ecotypes(ypr_population())
as_ypr_ecotypes(ypr_populations(Ls = c(10, 15, 20)))
as_ypr_ecotypes(ypr_ecotypes(Ls = c(10, 15, 20)))
}
\seealso{
Other ecotypes: 
\code{\link{ypr_ecotypes}()}
}
\concept{ecotypes}
