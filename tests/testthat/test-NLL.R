context('NLL')

nll = NLL$new()

test_that('forward',{


  #nll$forward(Ypred = c(1,1,4,3), Y = c(1,4,4,2))

  # double sample
  x1 = matrix(c(3, 3, 8,17), ncol = 2, nrow = 2)
  #r1 = matrix(c(6, 9, 0,3), ncol = 2, nrow = 2)
  #nll$forward(x1, )


})

test_that('backward',{

  # double sample
  #x1 = matrix(c(6, 9, -2, 3), ncol = 2, nrow = 2)
  #r1 = matrix(c(1, 1, 0, 1), ncol = 2, nrow = 2)
  #expect_equal(relu$backward(x1), r1)

})

test_that('NLL class fun',{




})





