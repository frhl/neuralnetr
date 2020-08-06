


test_that('Forward', {

  module = SquaredLoss$new()
  expect_equal(module$forward(Y = c(2, 4), Ypred = c(2, 3)), 0.5)
  expect_equal(module$forward(Y = c(2, 4, 6), Ypred = c(2, 3, 2)), 0.5 + 8)

})

test_that('Backward', {

  module = SquaredLoss$new()
  module$forward(Y = c(2, 1, 1), Ypred = c(2, 3, 1))
  backward = module$backward()
  expect_equal(backward, c(2,1,1) - c(2,3,1))

})


