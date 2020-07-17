

Linear <- R6Class("Linear", inherit = ClassModule,  list(

  m = matrix(),
  n = matrix(),
  W0 = matrix(),
  W = matrix(),
  A = matrix(),

  dLdW = matrix(),
  dLdW0 = matrix(),

  #' @description initialize the weights.
  #' @param m the m dimension of the module.
  #' @param n the n dimension of the module.
  initialize = function(m, n) {
    self$m = m
    self$n = n
    self$W0 = matrix(0, nrow=n, ncol=1)
    self$W = matrix(rnorm(n*m), nrow = m, ncol = n) # (m x n)
  },

  #' @description do one step forward.
  #' @param A input activation (m x b)
  #' @return Z pre-activation (n x b)
  forward = function(A){
    self$A = A   # (m x b)
    Z = t(self$W) %*% self$A %+% self$W0 # (n x b)
    return(Z)
  },

  #' @description do one gradient step backward
  #' @param dLdZ the derivative of the loss with
  #' respect to Z (n x b)
  #' @return dLdA (m x b)
  backward = function(dLdZ){ # (n x b)
    self$dLdW = self$A %*% t(dLdZ) # (m x n)
    self$dLdW0 = apply(dLdZ, 1, sum)
    dLdA = self$W %*% dLdZ # dLdA (m x b)
    return(dLdA)
  },

  #' @description update the weights using
  #' stochastic gradient descent
  #' @param lrate learning rate
  sgd_step = function(lrate){
    self$W = self$W - lrate * self$dLdW
    self$W0 = self$W0 - lrate * self$dLdW0
  })

)
