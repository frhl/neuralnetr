#' @title add arrays
#' @description broadcast arrays with python-like syntax.
#' @param x a n x m array
#' @param y a n x 1 or 1 x m array
#' @export

'%+%' <- function(x,y){
  if (dim(x)[1] == dim(y)[1]){
    return(sweep(x, 1, y, FUN = '+'))
  } else if (dim(x)[2] == dim(y)[2]){
    return(sweep(x, 2, y, FUN = '+'))
  }
  stop('non-conformable arrays')
}

#' @title subtract arrays
#' @description broadcast arrays with python-like syntax.
#' @param x a n x m array
#' @param y a n x 1 or 1 x m array
#' @export

'%-%' <- function(x,y){
  if (dim(x)[1] == dim(y)[1]){
    return(sweep(x, 1, y, FUN = '-'))
  } else if (dim(x)[2] == dim(y)[2]){
    return(sweep(x, 2, y, FUN = '-'))
  }
  stop('non-conformable arrays')
}

argmax = function(x, margin = 2){
  return(apply(x, margin, function(i) which(i==max(i))))
}
