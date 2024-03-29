% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.R
\name{plot.ypr_population}
\alias{plot.ypr_population}
\title{Plot Population Schedule}
\usage{
\method{plot}{ypr_population}(x, type = "b", ...)
}
\arguments{
\item{x}{The population to plot.}

\item{type}{A string specifying the plot type.
Possible values include 'b', 'p' and 'l'.}

\item{...}{Additional arguments passed to \link[graphics:plot.default]{graphics::plot} function.}
}
\value{
An invisible copy of the original object.
}
\description{
Plot Population Schedule
}
\examples{
\dontrun{
plot(ypr_population())
}
}
\seealso{
\link[graphics:plot.default]{graphics::plot}
}
