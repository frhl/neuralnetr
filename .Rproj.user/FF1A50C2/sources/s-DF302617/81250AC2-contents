#' @title Activation modules
#' @description Each activation module has a forward method that
#' takes in a batch of pre-activations Z and returns a batch of
#' activations A.
#'
#' Each activation module has a backward method that takes in dLdA and
#' returns dLdZ, with the exception of SoftMax, where we assume dLdZ is
#' passed in.

ReLU <- R6Class("Module", list(

  A = 0,

  forward = function(Z) {
    self$A = ifelse(Z>0, Z, 0)
    return(self$A)
  },
  backward = function(dLdA){
    dLdZ = ifelse(dLdA>0, 1, 0)
    return(dLdZ)
  })
)


Tanh <- R6Class("Module", list(

  A = 0,

  forward = function(Z) {
    self$A = base::tanh(Z)
    return(self$A)
  },
  backward = function(dLdA){
    dLdZ = dLdA*(1 - (self$A^2))
    return(dLdZ)
  })
)











