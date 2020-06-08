#' @title Sequential neural networks
#'
#' @description Setup a sequential (uni-directional) deep
#' feed forward neural network. The Sequential is used as a
#' wrapper for the modules.
#'
#' @examples
#' \dontrun{
#' ## classification problem
#' nn = Sequential$new(list(
#' Linear$new(2,10), ReLU$new(),
#' Linear$new(10,10), Tanh$new(),
#' Linear$new(10,2), SoftMax$new()),
#' NLL$new())
#'
#'
#' }
#' @family architecture
#' @export


Sequential <- R6Class("Sequential", inherit = ClassModule, list(

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
    D = dim(X)[2]; N = dim(Y)[2]
    sum_loss = 0
    track_loss = c()

    for (it in 1:iters){

      # Randomly pick a data point Xt, Yt by using sample
      # to choose a random index into the data.
      i = sample(1:D, 1)

      Xt = X[,i]
      Yt = Y[,i]
      Ypred = self$forward(Xt)
      cur_loss = self$loss$forward(Ypred, Yt)
      sum_loss = sum_loss + cur_loss
      err = self$loss$backward()
      track_loss = c(track_loss, sum_loss)
      self$backward(err)
      self$sgd_step(lrate)

      self$print_accuarcy(it, X, Y, cur_loss)
    }

    return(track_loss)

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

  #' @description classify the labels of the input
  #' @param X input X
  classify = function(X){
    cf = self$modules[[length(self$modules)]]$class_fun
    return(cf(self$forward(X)))
  },

  #' @description print accuracy during training
  #' @param it iteration number
  #' @param X data X
  #' @param Y target Y
  #' @param cur_loss the current loss
  #' @param every how often should the function return feeddback?
  print_accuarcy = function(it, X, Y, cur_loss, every=250){
    if (it %% every == 0){
      cf = self$modules[[length(self$modules)]]$class_fun
      acc = mean(cf(self$forward(X)) == as.numeric(cf(Y)))
      write(paste('Iteration =', it, '\tAcc =', acc, '\tLoss =', cur_loss),stdout())
    }
  })
)



