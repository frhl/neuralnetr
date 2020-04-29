


nn = Sequential$new(list(
  Linear$new(2,3), Tanh$new(),
  Linear$new(3,3), Tanh$new(),
  Linear$new(3,2), SoftMax$new()),
  NLL$new())


X = t(as.matrix(data.frame(x1=c(2,3,9,12),x2=c(5,2,6,5))))
Y = t(as.matrix(data.frame(y1=c(0,1,0,1),y2=c(1,0,1,0))))

nn$sgd(X, Y, 10000, 0.005)
