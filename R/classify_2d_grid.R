#' @title Classify 2d plot
#'
#' @description generate a matrix with decision boundaries and softmax probabilities
#' by classifying a sequence of (x, y) pairs.
#' @param nn the neural network.
#' @param xlims vector. xlimits.
#' @param ylims vector. ylimits.
#' @param bys how fine should the grid be?
#' @return data.frame
#' @export


classify_2d_grid = function(nn, xlims = c(0, 2), ylims = c(0, 2), bys = 0.1){

  # expand the grid
  x <- seq(xlims[1], xlims[2], by = bys)
  y <- seq(ylims[1], ylims[2], by = bys)
  d1 <- expand.grid(x = x, y = y)

  # classify
  probs <- as.data.frame(t(nn$forward(t(as.matrix(d1)))))
  colnames(probs) <- paste0(rep('softmax.c', ncol(probs)), 1:ncol(probs))
  probs$class <- as.factor(nn$classify(t(as.matrix(d1))))
  d1 <- cbind(d1, probs)

  return(d1)

}
