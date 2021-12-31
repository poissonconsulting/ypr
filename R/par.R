set_par <- function(object, par, value) {
  if(is.ypr_population(object)) {
    object[[par]] <- value
  } else {
    for(i in seq_len(length(object))) {
      object[[i]] <- set_par(object[[i]], par, value = value)
    }
  }
  object
}

get_par <- function(object, par) {
  if(is.ypr_population(object)) {
    return(object[[par]])
  }
  unname(sapply(object, get_par, par))
}
