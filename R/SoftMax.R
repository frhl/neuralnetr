#' @title SoftMax
#' @description Classic softmax that can be interpreted as a probability
#' distribution over n items
#'
#' For `SoftMax$class_fun()`, given the column
#' vector of class probabilities for each point (computed by Softmax), return
#' a vector of the classes (integers) with the highest probability for each point.
#'
#' @family activation
#' @export


SoftMax <- R6Class("SoftMax", inherit = ClassModule, list(

  #' @param Z a vector of pre-activations.
  #' @return probabilities of the given class
  forward = function(Z) {
    return(exp(Z) / sum(exp(Z)))
  },

  #' @param dLdZ a vector of gradients dLdZ.
  #' @return dLdZ
  backward = function(dLdZ) {
    return(dLdZ)
  },

  #' @description a classify function.
  #' @param Ypred a vector of predictions.
  #' @return the index for the vector of the
  #' predicted label.
  class_fun = function(Ypred){
    return(which(Ypred == max(Ypred)))
  }
  )
)
