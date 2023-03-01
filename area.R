func <- function(x,y,z) {
  s <- sum(x,y,z)/2
  return(sqrt(s*(s-x)*(s-y)*(s-z)))
}
