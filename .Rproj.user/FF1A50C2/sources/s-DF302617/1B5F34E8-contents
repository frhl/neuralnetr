

set.seed(1)

test_that("forward", {

  X = t(as.matrix(data.frame(x1=c(2,3,9,12),x2=c(5,2,6,5))))
  Y = t(as.matrix(data.frame(y1=c(0,1,0,1),y2=c(1,0,1,0))))
  linear_1 = linear$new(2, 3)

  forward = linear_1$forward(X)
  expect_equal(dim(forward), c(3,4)) # n x b = n  x

})

test_that("backward",{


  dL_dz1 = matrix(c(1.69467553e-09, -1.33530535e-06, 0.00000000e+00, -0.00000000e+00,
                   -5.24547376e-07, 5.82459519e-04, -3.84805202e-10, 1.47943038e-09,
                   -3.47063705e-02, 2.55611604e-01, -1.83538094e-02, 1.11838432e-04), nrow = 3, ncol = 4, byrow = T)

  backward = linear_1$backward(dL_dz1)
  expect_equal(dim(backward), c(2,4))
  #expect_equal(sum(backward), 0.2288266, tolerance = 10e-6)



})







