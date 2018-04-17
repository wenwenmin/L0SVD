# Extracting the first u and v
# 4/14/2015
L0_SVD = function(X, ku, kv, niter=1000, err=0.0001){
  # Test: X=matrix(runif(80,0,1),10,8);c1=c2=0.5;out=scrank1(X, c1, c2, niter=500, err=0.000001);
  # Initialize
  # set.seed(123)
  # m = nrow(X)
  # u0 =matrix(runif(m,0,1));#v=v/norm(matrix(v),'2')
  set.seed(1234)
  n = ncol(X)
  v0 =matrix(runif(n,0,1));#v=v/norm(matrix(v),'2')
  d0 = 0
  # Iterative algorithm to solve u and v values
  for (i in 1:niter){
    z = X%*%v0;    k = ku
    u = project(z, k) # Project algorithm to solve sparse v
    z = t(X)%*%u; k = kv
    v = project(z, k) # Project algorithm to solve sparse u 
	
	d = t(v)%*%z
    # Algorithm termination condition norm(matrix(v),'2')
    if (norm(d - d0,'2')<= err){
      break
    }
    else {
      d0 = d
      v0 = v
    }
  }
  d =t(u)%*%X%*%v
  return (list(u=u, v=v, d=d))
}
######################
# project algorithm
######################
project=function(z, k){  
  absz = abs(z); 
  sorz = matrix(sort(absz,decreasing = TRUE))
  Threshold = sorz[k]
  z[absz <Threshold] = 0
  u_star = z/norm(z,'2')
  return(u_star)
}
##############
# mian
# X=matrix(runif(800,0,1),100,80)
# set.seed(1)
# u <- matrix(c(rnorm(100), rep(0,200)),ncol=1);#u <- u/norm(u,'2')
# v <- matrix(c(rnorm(50),rep(0,150)), ncol=1);#v <- v/norm(v,'2')
# d = 1
# eta = 1
# X <- d*u%*%t(v)+eta*matrix(rnorm(300*200),ncol=200)
# 
# out=l0svd(X, 100, 50)
# u.id=matrix(which(out$u!=0))
# v.id=matrix(which(out$v!=0))

