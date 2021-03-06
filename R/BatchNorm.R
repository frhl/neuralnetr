#' @title Batch Normalization
#'
#' @description Avoid internal covariate shift by
#' standardizing input values for each mini batch,
#' meaning that the scale of the inputs remain the same
#' regardless of how the weights in the previous layer
#' changes.
#'
#' @note work in progress
#'
#'
#' @family architecture
#' @source https://arxiv.org/abs/1502.03167 / MIT
#'
#'


BatchNorm <- R6Class("BatchNorm", inherit = ClassModule, list(

  #' @field eps small constant avoid division by zero.
  #' @field m number of input channels
  #' @field B weights (nl × 1 vector)
  #' @field G weights (nl × 1 vector)
  eps = 10e-18,
  m = NULL,
  B = NULL,
  G = NULL,

  # initialize learned shifts and scaling
  initialize = function(m, seed) {
    set.seed(seed)
    self$m = m
    self$B = matrix( rep(0, m), ncol = 1)
    self$G = matrix( rnorm(m, 0, 1*self$m^(-0.5)), ncol = 1)
  },


  #' @field A m x K: m input channels and mini-batch size K
  #' @field K mini-batch size.
  #' @field mus batch-wise means.
  #' @field vars batch-wise variances.
  #' @field batch-wise normalized inputs using input, mus, vars and eps.
  A = NULL,
  K = NULL,
  mus = NULL,
  vars = NULL,
  norm = NULL,

  # Works on m x b matrices of m input channels and b different inputs
  forward = function(A) {

    self$A = A
    self$K = ncol(A)

    # calculate batch-wise means and standard deviations
    self$mus = NULL
    self$vars = NULL

    # # Normalize inputs using their mean and standard deviation
    self$norm = NULL  # Your Code

    # Return scaled and shifted versions of self.norm
    return(NULL)

  },


  backward = function(dLdZ) {

    # Re-usable constants
    std_inv = 1/sqrt(self$vars+self$eps)
    A_min_mu = self$A-self$mus

    dLdnorm = dLdZ * self$G
    # dLdVar = np.sum(dLdnorm * A_min_mu * -0.5 * std_inv**3, axis=1, keepdims=True)
    # dLdMu = np.sum(dLdnorm*(-std_inv), axis=1, keepdims=True) + dLdVar * (-2/self.K) * np.sum(A_min_mu, axis=1, keepdims=True)
    # dLdX = (dLdnorm * std_inv) + (dLdVar * (2/self.K) * A_min_mu) + (dLdMu/self.K)

    # self.dLdB = np.sum(dLdZ, axis=1, keepdims=True)
    # self.dLdG = np.sum(dLdZ * self.norm, axis=1, keepdims=True)
    # return dLdX

  },

  step = function(lrate) {

    self$B = NULL
    self$G = NULL
    return(NULL)

  })
)

