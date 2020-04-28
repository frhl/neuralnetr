



'%+%' <- function(x,y){
  if (dim(x)[1] == dim(y)[1]){
    return(sweep(x, 1, y, FUN = '+'))
  } else if (dim(x)[2] == dim(y)[2]){
    return(sweep(x, 2, y, FUN = '+'))
  }
  stop('non-conformable arrays')
}

'%-%' <- function(x,y){
  if (dim(x)[1] == dim(y)[1]){
    return(sweep(x, 1, y, FUN = '-'))
  } else if (dim(x)[2] == dim(y)[2]){
    return(sweep(x, 2, y, FUN = '-'))
  }
  stop('non-conformable arrays')
}
