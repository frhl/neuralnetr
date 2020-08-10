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


#' @title standardize
#' @description center array around mean of zero, and sd of one.
#' @export
standardize <- function(x) return((x - mean(x))/sd(x))


#' @title onehot encoding
#' @description converts labels into one hot encoding.
#' @export
onehot <- function(labels) {
  M <- matrix(rep(0, length(labels) * length(unique(labels))), ncol = length(labels))
  O <- unlist(lapply(labels, function(x){min(which(labels %in% x))}))
  convert <- data.frame(from = unique(O), lab = unique(labels), to = 1:length(unique(O)))
  j <- 1
  for (i in 1:length(labels)){
    j <- convert$to[convert$from == O[i]]
    M[j, i] <- 1
  }
  row.names(M) <- unique(labels)
  return(M)
}


