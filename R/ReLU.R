#' @title Rectified linear outout activation
#' @description Each activation module has a forward method that
#' takes in a batch of pre-activations Z and returns a batch of
#' activations A.
#'
#' Each activation module has a backward method that takes in dLdA and
#' returns dLdZ, with the exception of SoftMax, where we assume dLdZ is
#' passed in.
#' @family activation
#' @export

ReLU <- R6Class("ReLU", inherit = ClassModule, list(

  #' @field A the activation vector
  A = NULL,

  #' @param Z a vector of pre-activations
  #' @return a vector of activations.
  forward = function(Z) {
    self$A = ifelse(Z>0, Z, 0)
    return(self$A)
  },

  #' @param dLdA vector of gradients.
  #' @return a vector gradeints.
  backward = function(dLdA){
    dLdZ = dLdA * as.numeric(self$A != 0)
    return(dLdZ)
  })
)
