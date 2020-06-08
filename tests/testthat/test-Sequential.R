context('Sequential')


#expect_that('Sequential can be setup like a neural network',{


# setup problem
nn = Sequential$new(list(
  Linear$new(2,10), ReLU$new(),
  Linear$new(10,10), Tanh$new(),
  Linear$new(10,2), SoftMax$new()),
  NLL$new())


# xor problem
X = t(as.matrix(data.frame(x1=c(1,2,1,2),x2=c(1,2,2,1))))
Y = t(as.matrix(data.frame(y1=c(0,0,1,1),y2=c(1,1,0,0))))

q = nn$sgd(X, Y, 2500, 0.05)


#xor <- list(X, Y)
#names(xor) <- c('X', 'Y')
#saveRDS(xor, file = 'data/xor.rsa', compress = 'xz')


plot_tidy_2d(nn, X)






