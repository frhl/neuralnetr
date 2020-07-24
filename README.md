[![Build Status](https://travis-ci.org/frhl/neuralnetr.svg?branch=master)](https://travis-ci.org/frhl/neuralnetr)

# neuralnetr

A package for playing around with keras-like neural networks using R6 methods and base R. This is just an experiment, and the current version only allows for binary classification through stochastic gradient descent optimization. The next versions will contain loss functions for regression, minibatch gradient decent, better optimizers (the famous ADAM), and a batch normalization module to account for internal covariate shifting.

## Running a deep feed-forward neural network (Binary classification)

```R


# setup architecture 
nn = Sequential$new(list(
  Linear$new(2,10), ReLU$new(),
  Linear$new(10,10), Tanh$new(), # 1 x 10 neurons, w. tanh activation
  Linear$new(10,2), SoftMax$new()),
  NLL$new())


# xor problem
X = t(as.matrix(data.frame(x1=c(1,2,1,2),x2=c(1,2,2,1))))
Y = t(as.matrix(data.frame(y1=c(0,0,1,1),y2=c(1,1,0,0))))
q = nn$sgd(X, Y, 2500, 0.05) # 5000 iterations, 0.05 learning rate
q = nn$classify(X)
plot_tidy_2d(nn, X)


```
Running the above code would yield the following classification boundaries:

![alt text](https://github.com/frhl/neuralnetr/blob/master/images/xor.png?raw=true)





