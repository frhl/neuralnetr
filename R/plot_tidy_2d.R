#' @title plot_tidy_2d
#'
#' @description plot a 2d scatter plot with confidence tiles.
#' @param nn the neural network.
#' @param X the X data. A data.frame that is 2xN
#' @return a ggplot
#' @export


plot_tidy_2d <- function(nn, X){

  # classify grid
  map = classify_2d_grid(nn, xlim = c(-5,5), ylim = c(-5,5), bys = 0.05)

  # classify objects
  actual = as.data.frame(t(X))
  actual$confidence = nn$classify(X)

  # setup plot
  p = ggplot() +
    geom_tile(data = map, aes(x=x,y=y,fill=class), color='white') +
    geom_point(data = actual, aes(x=x1, y=x2, fill = confidence), size = 4, shape = 21, stroke = 0.5) +
    theme_minimal()

  return(p)
}
