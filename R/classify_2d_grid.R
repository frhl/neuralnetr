#' @title Classify 2d plot
#'
#' @description convert a scatter plot into a grid-like plot of preditction confidence.
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
  d1$class = nn$forward(t(as.matrix(d1)))[1,]

  return(d1)

}
