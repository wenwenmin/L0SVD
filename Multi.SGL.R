# Function for MSGL model 
# ------------------------------
Multi.SGL=function(X,Y,index,lambdas = 0.05,gamma = 0.8,alpha = 0.95){
   
  beta=matrix(0,ncol(X),ncol(Y))
  
  for(i in 1:ncol(Y)){
    
    print(i)
    
    data = list(x = X, y = Y[,i])
    fit = SGL(data, index, type = "linear",lambdas = lambdas, gamma = gamma,alpha = alpha)
    beta[,i] = as.matrix(fit$beta)
  }
  
  return(beta = beta)
}

# ------------------------------
# coding: utf-8 
# Test data
# BETA = Mult_SGL(X,Y,index,lambda=0.05)
# Sparse Group Lasso
# SGL_BETA = Mult_SGL(X,Y,index,lambdas=0.05,gamma = 0.08)
# X:50*100
# Y:50*3
# beta:100*3
# ------------------------------