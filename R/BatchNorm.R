


BatchNorm <- R6Class("BatchNorm", inherit = ClassModule, list(

  #' @field eps tbd
  eps = NA

))

#class BatchNorm(Module):
#      def __init__(self, m):
#      np.random.seed(0)
#    self.eps = 1e-20
#    self.m = m  # number of input channels
#
#    # Init learned shifts and scaling factors
#    self.B = np.zeros([self.m, 1])
#    self.G = np.random.normal(0, 1.0 * self.m ** (-.5), [self.m, 1])
#
#    # Works on m x b matrices of m input channels and b different inputs
#    def forward(self, A):# A is m x K: m input channels and mini-batch size K
#      # Store last inputs and K for next backward() call
#      self.A = A
#    self.K = A.shape[1]
#
#    self.mus = None  # Your Code
#    self.vars = None  # Your Code
#
#    # Normalize inputs using their mean and standard deviation
#    self.norm = None  # Your Code
#
#    # Return scaled and shifted versions of self.norm
#    return None  # Your Code
#
#    def backward(self, dLdZ):
#      # Re-usable constants
#      std_inv = 1/np.sqrt(self.vars+self.eps)
#    A_min_mu = self.A-self.mus
#
#    dLdnorm = dLdZ * self.G
#    dLdVar = np.sum(dLdnorm * A_min_mu * -0.5 * std_inv**3, axis=1, keepdims=True)
#    dLdMu = np.sum(dLdnorm*(-std_inv), axis=1, keepdims=True) + dLdVar * (-2/self.K) * np.sum(A_min_mu, axis=1, keepdims=True)
#    dLdX = (dLdnorm * std_inv) + (dLdVar * (2/self.K) * A_min_mu) + (dLdMu/self.K)
#
#    self.dLdB = np.sum(dLdZ, axis=1, keepdims=True)
#    self.dLdG = np.sum(dLdZ * self.norm, axis=1, keepdims=True)
#    return dLdX
#
#    def step(self, lrate):
#      self.B = None  # Your Code
#    self.G = None  # Your Code
#    return
