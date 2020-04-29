#' @title Negative Log Liklihood
#' @description
#' Each loss module has a forward method that takes in a batch of predictions Ypred
#' (from the previous layer) and labels Y and returns a scalar loss value.
#'
#' The NLL module has a backward method that returns dLdZ, the gradient with respect
#' to the preactivation to SoftMax (note: not the activation!), since we are always
#' pairing SoftMax activation with NLL loss


NLL <- R6Class("Module", inherit = ClassModule, list(

  #inherit

  Ypred = NULL,
  Y = NULL,

  forward = function(Ypred, Y) {
    self$Ypred = Ypred
    self$Y = Y
    loss = sum(-Y * log(Ypred))
    return(loss)
  },
  backward = function(){
    return(self$Ypred-self$Y)
  })
)

