
test_that('experiment 1 (sin)',{
  set.seed(1)
  nn = Sequential$new(list(
    Linear$new(2,7), Tanh$new(),
    Linear$new(7,7), Tanh$new(),
    #Linear$new(10,10), Tanh$new(),
    #Linear$new(10,10), Tanh$new(),
    #Linear$new(10,10), Tanh$new(),
    Linear$new(7,2), SoftMax$new()), # note, the 3 output neurons
    NLL$new())

  # xor problem
  n = 200
  X = t(as.matrix(data.frame(x1=runif(n, -5, 5), x2=runif(n, -5, 5))))
  f = function(x) sin(x) ** 3 * 5
  rule = ifelse(X[2, ] < f(X[1, ]), 1, 2)
  Y = onehot(rule)

  # plot curve
  plot(X[1,], X[2,], col = rule)
  sin.curve = seq(-5,5,length.out = 100)
  points(sin.curve, f(sin.curve), type = 'l')

  q = nn$sgd(X, Y, 75000, 0.001)
  q = nn$classify(X)
  plot_tidy_2d(nn, X)
  accuracy = mean(q+1!=rule)
  expect_gt(accuracy, 0.9) # expect >90% accuracy
})
