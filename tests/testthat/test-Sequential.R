context('Sequential')


#expect_that('Sequential can be setup like a neural network',{



  nn = Sequential$new(list(
    Linear$new(2,10), Tanh$new(),
    Linear$new(10,2), SoftMax$new()),
    NLL$new())

  #expect_equal(length(nn$modules), 6)

#})

#expect_that('Sequential can be run like a neural network',{

  X = t(as.matrix(data.frame(x1=c(1,2,1,2),x2=c(1,2,2,1))))
  Y = t(as.matrix(data.frame(y1=c(0,0,1,1),y2=c(1,1,0,0))))

  q = nn$sgd(X, Y, 5000, 0.01)

  round(nn$forward(X), 2)




  #plot(1:length(q), q, type = 'l')

 predict(X, nn)


  predict <- function(x, nn){
    Ypred = nn$forward(X)
    return(nn$modules[[length(nn$modules)]]$class_fun(Ypred))
  }


  predict(X[,1], nn)


  #plot(t(X))


  #X, Y = super_simple_separable()
  #nn.sgd(X, Y, iters=1, lrate=0.005)
  #Ypred = nn.forward(X)
  #return nn.modules[-1].class_fun(Ypred).tolist(), [nn.loss.forward(Ypred, Y)]



  expect_true(T)

#})










