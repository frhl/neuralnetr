context('Sequential')


test_that('Sequential can be setup like a neural network',{

  set.seed(1)
    # setup problem
    nn = Sequential$new(list(
      Linear$new(2,5), ReLU$new(),
      Linear$new(5,5), Tanh$new(),
      Linear$new(5,2), SoftMax$new()),
      NLL$new())

    # xor problem
    data(xor_example)
    X = xor_example$X
    Y = xor_example$Y

    # training with stochastic gradient decsent
    nn$sgd(X, Y, 2500, 0.05)

    # expect
    expect_equal(nn$classify(X), c(1,1,0,0))

})

test_that('Minibatch gradient descent',{

  set.seed(1)
  # setup problem
  nn = Sequential$new(list(
    Linear$new(2,5), ReLU$new(),
    Linear$new(5,2), SoftMax$new()),
    NLL$new())

  # xor problem
  data(xor_example)
  X = xor_example$X
  Y = xor_example$Y

  # training with mini-batch gradient descent
  nn$mini_gd(X, Y, 2500, 0.05,  K = 2)

  # expect
  expect_equal(nn$classify(X), c(1,1,0,0))

})

test_that('Multiclass classification',{

  set.seed(1)
  nn = Sequential$new(list(
    Linear$new(2,2), ReLU$new(),
    Linear$new(2,3), SoftMax$new()), # note, the 3 output neurons
    NLL$new())

  # xor problem
  X = t(as.matrix(data.frame(x1=c(1,2,1,2),x2=c(1,2,2,1))))
  Y = onehot(c('C','A','B','C'))
  q = nn$sgd(X, Y, 2500, 0.05)
  q = nn$classify(X)
  plot_tidy_2d(nn, X)

  expect_equal(q, c(0,1,2,0))

})



