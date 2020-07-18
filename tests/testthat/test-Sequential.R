context('Sequential')


test_that('Sequential can be setup like a neural network',{

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

    # training
    nn$sgd(X, Y, 2500, 0.05)

    # expect
    expect_equal(nn$classify(X), c(1,1,0,0))

})







