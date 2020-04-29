


sequential <- function(modules, loss){
  return(Sequential$new(modules, loss))
}

Sequential <- R6Class("Module", inherit = ClassModule, list(

  loss = NA,
  modules = NULL,

  initialize = function(modules, loss) {  # modules and loss module
    self$modules = modules
    self$loss = loss
  },

  sgd = function(X, Y, iters=100, lrate=0.005){
    D = dim(X)[1]; N = dim(Y)[2]
    sum_loss = 0


    for (it in 1:iters){

      # Randomly pick a data point Xt, Yt by using sample
      # to choose a random index into the data.
      i = sample.int(D, 1)
      Xt = X[,i]
      Yt = Y[,i]

      Ypred = self$forward(Xt)
      sum_loss = sum_loss + self$loss$forward(Ypred, Yt)
      err = self$loss$backward()
      self$backward(err)
      self$sgd_step(lrate)
    }

  },

  forward = function(Xt){

    for (m in self$modules) Xt = m$forward(Xt)
    return(Xt)

  },

  backward = function(delta){

    for (m in rev(self$modules)) delta = m$backward(delta)

  },

  sgd_step = function(lrate){

    for (m in self$modules) m$sgd_step(lrate)

  })
)



