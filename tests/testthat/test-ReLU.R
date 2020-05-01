context('ReLU')

relu = ReLU$new()

test_that('forward method',{

  # double sample
  #x1 = matrix(c(6, 9, -2,3), ncol = 2, nrow = 2)
  #r1 = matrix(c(6, 9, 0,3), ncol = 2, nrow = 2)
  #expect_equal(relu$forward(x1), r1)

})

test_that('backward method',{

  # double sample
  #x1 = matrix(c(6, 9, -2, 3), ncol = 2, nrow = 2)
  #r1 = matrix(c(1, 1, 0, 1), ncol = 2, nrow = 2)
  #expect_equal(relu$backward(x1), r1)

})



