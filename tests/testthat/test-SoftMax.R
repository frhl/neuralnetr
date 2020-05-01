context('SoftMax')

softmax = SoftMax$new()


m1 = matrix(c(1,4,2,7,80,1), nrow = 2)

round(softmax$forward(m1), 2)

