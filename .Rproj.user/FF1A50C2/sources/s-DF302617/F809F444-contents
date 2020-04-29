#' @title SoftMax
#' @description
#'
#' For `SoftMax$class_fun()`, given the column
#' vector of class probabilities for each point (computed by Softmax), return
#' a vector of the classes (integers) with the highest probability for each point.
#'
#'


SoftMax <- R6Class("Module", inherit = ClassModule, list(

  forward = function(Z) {
    return(exp(Z) / sum(exp(Z)))
  },
  backward = function(dLdZ) {
    return(dLdZ)
  },
  class_fun = function(Ypred){
    return(which(Ypred == max(Ypred)))
  }
  )
)
