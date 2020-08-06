#' @title Squared loss
#' @description
#' Each loss module has a forward method that takes in a batch of predictions Ypred
#' (from the previous layer) and labels Y and returns a scalar loss value.
#'
#' The NLL module has a backward method that returns dLdZ, the gradient with respect
#' to the preactivation to SoftMax (note: not the activation!), since we are always
#' pairing SoftMax activation with NLL loss
#'
#' @family loss
#' @export


SquaredLoss <- R6Class("SquaredLoss", inherit = ClassModule, list(

  #' @field Ypred the predicted Y vector
  #' @field Y the actual Y vector
  Ypred = NULL,
  Y = NULL,

  #' @description Calculate the loss.
  #' @param Ypred the predicted Y vector.
  #' @param Y the actual Y vector.
  #' @return loss as a scalar
  forward = function(Ypred, Y) {
    self$Ypred = Ypred
    self$Y = Y
    loss = sum(0.5*(Y - Ypred)^2)
    return(loss)
  },

  #' @description calculate the
  #' gradient w.r.t. the loss
  #' @return  dLdZ (? x b)
  backward = function(){
    return(self$Y - self$Ypred)
  })
)

