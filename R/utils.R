inst2inter <- function(x) {
  1 - exp(-x)
}

inter2inst <- function(x) {
  -log(1 - x)
}
