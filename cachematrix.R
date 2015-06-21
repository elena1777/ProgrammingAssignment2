
#Below are two functions that  create 
a special object that stores a matrix and cache's its inverse.
First (makeCacheMatrix) returns an object 
which is a list of functions.
Second (cacheSolve) invert special "matrix" 
created with makeCacheMatrix.
set()  lets you pass a new vector to the object 
created by cacheVector - replacing the one used
 originaly when the object was created.
<<-` operator which can be used to
 assign a value to an object in an environment that 
is different from the
 current environment. #
<!-- -->

makeCacheMatrix<- function(x = matrix()) {
  m<-NULL
  set<-function(y){
  x<<-y
  m<<-NULL
                  }

    get<-function() x
    setmatrix<-function(solve) m<<- solve
    getmatrix<-function() m

   list(set=set, get=get,
        setmatrix=setmatrix,
        getmatrix=getmatrix)
}

cacheSolve <- function(x=matrix(), ...) {
    m<-x$getmatrix()
    if(!is.null(m)){
           message("getting cached data")
           return(m)
                    }
    data<-x$get()
    m<-solve(data, ...)
    x$setmatrix(m)
    m
}

<!-- -->
testing

> ex<- matrix(c( mtcars$hp[1:4],  mtcars$drat[1:4], mtcars$wt[1:4], mtcars$qsec[1:4]), nrow=4, ncol=4)
> ex
     [,1] [,2]  [,3]  [,4]
[1,]  110 3.90 2.620 16.46
[2,]  110 3.90 2.875 17.02
[3,]   93 3.85 2.320 18.61
[4,]  110 3.08 3.215 19.44
> det(ex)
[1] -128.6067
> solve(ex)
            [,1]       [,2]        [,3]        [,4]
[1,]  0.14604310 -0.1340770 -0.03034688  0.02278171
[2,] -1.45641786  2.1213606  0.36496542 -0.97350446
[3,] -4.10408465  4.7008934 -0.39276335 -0.26474514
[4,]  0.08310998 -0.3548711  0.17884760  0.12055359

> a<-makeCacheMatrix (ex)
> test(a)
     [,1] [,2]  [,3]  [,4]
[1,]  110 3.90 2.620 16.46
[2,]  110 3.90 2.875 17.02
[3,]   93 3.85 2.320 18.61
[4,]  110 3.08 3.215 19.44
> cacheSolve(a)
            [,1]       [,2]        [,3]        [,4]
[1,]  0.14604310 -0.1340770 -0.03034688  0.02278171
[2,] -1.45641786  2.1213606  0.36496542 -0.97350446
[3,] -4.10408465  4.7008934 -0.39276335 -0.26474514
[4,]  0.08310998 -0.3548711  0.17884760  0.12055359
> 
