#' @title Linear modules
#
#' @description Each linear module has a forward method that takes in a batch of
# activations A (from the previous layer) and returns
# a batch of pre-activations Z.
#
# Each linear module has a backward method that takes in dLdZ and
# returns dLdA. This module also computes and stores dLdW and dLdW0,
# the gradients with respect to the weights.

Linear <- R6Class("Module", inherit = ClassModule,  list(

  m = matrix(),
  n = matrix(),
  W0 = matrix(),
  W = matrix(),
  A = matrix(),

  dLdW = matrix(),
  dLdW0 = matrix(),

  initialize = function(m, n) {
    self$m = m
    self$n = n
    self$W0 = matrix(0, nrow=n, ncol=1)
    self$W = matrix(rnorm(n*m), nrow = m, ncol = n) # (m x n)
  },

  forward = function(A){
    self$A = A   # (m x b)
    Z = t(self$W) %*% self$A %+% self$W0 # (n x b)
    return(Z)
  },

  backward = function(dLdZ){ # (n x b)
    self$dLdW = self$A %*% t(dLdZ) # (m x n)
    self$dLdW0 = apply(dLdZ, 1, sum)
    dLdA = self$W %*% dLdZ # dLdA (m x b)
    return(dLdA)
  },

  sgd_step = function(lrate){
    self$W = self$W - lrate * self$dLdW
    self$W0 = self$W0 - lrate * self$dLdW0
  })


)



