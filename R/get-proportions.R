get_proportions <- function(x) {
  x <- get_par(x, "RPR")
  x / sum(x)
}
