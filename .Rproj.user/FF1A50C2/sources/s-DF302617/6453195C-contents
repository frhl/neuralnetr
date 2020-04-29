#' @title Sequential neural networks
#'
#' @description Setup a sequential (uni-directional) deep
#' feed forward neural network. The Sequential is used as a
#' wrapper for the modules.
#'
#'
#' @family architecture
#' @export


Sequential <- R6Class("Module", inherit = ClassModule, list(

  #' @field loss The loss module
  #' @field modules the list of current modules
  loss = NA,
  modules = NULL,

  #' @description setup the neural network
  #' @param modules list of modules
  #' @param loss the loss module
  initialize = function(modules, loss) {  # modules and loss module
    self$modules = modules
    self$loss = loss
  },

  #' @description train neural network using stochastic gradient descent
  #' @param X the X input (m x b)
  #' @param Y the Y (target) input
  #' @param iters amount of iterations.
  #' @param lrate the learning rate.
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

  #' @description Compute Ypred
  #' @param Xt the input at time t
  forward = function(Xt){

    for (m in self$modules) Xt = m$forward(Xt)
    return(Xt)

  },

  #' @description Update dLdW and dLdW0
  #' @param delta the backpropagated error
  #' @note Note that delta can refer to dLdA or dLdZ over the
  #' course of the for loop, depending on the module m
  backward = function(delta){

    for (m in rev(self$modules)) delta = m$backward(delta)

  },

  #' @description  gradient descent step
  #' @param lrate the learning rate
  sgd_step = function(lrate){

    for (m in self$modules) m$sgd_step(lrate)

  },

  #' @description print accuracy during training
  #' @param it iteration number
  #' @param X data X
  #' @param Y target Y
  #' @param cur_loss the current loss
  #' @param every how often should the function return feeddback?
  print_accuarcy = function(it, X, Y, cur_loss, every=100){
    if (it %% every == 0){
      #cf = rev(self$Modules)
      #cf = self.modules[-1].class_fun
      #acc = np.mean(cf(self.forward(X)) == cf(Y))
      #print('Iteration =', it, '\tAcc =', acc, '\tLoss =', cur_loss, flush=True)
    }
  })
)



