

NLL <- R6Class("Module", list(

  Ypred = NULL,
  Y = NULL,

  forward = function(Ypred, Y) {
    self$Ypred = Ypred
    self$Y = Y
    loss = apply(-Y * log(Ypred), 2, sum)
    return(loss)
  },
  backward = function(){
    return(self$Ypred-self$Y)
  })
)

