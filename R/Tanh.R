
Tanh <- R6Class("Tanh", inherit = ClassModule, list(

  #' @field A the activation vector
  A = NULL,

  #' @param Z a vector of pre-activations
  #' @return a vector of activations.
  forward = function(Z) {
    self$A = base::tanh(Z)
    return(self$A)
  },

  #' @param dLdA vector of gradients.
  #' @return a vector gradients.
  backward = function(dLdA){
    dLdZ = dLdA*(1 - (self$A^2))
    return(dLdZ)
  })
)
