## The 2 functions computes and stores the inverse of the matrix

## This function creates a "matrix" object that contains a list of functions that:
## 1. sets the value of the matrix
## 2. Gets the value fo the matrix
## 3. Sets the value of the inverse matrix
## 4. Gets the value of the inverse matrix


makeCacheMatrix <- function(x = matrix()) {
  s<- NULL
  set<-function(y){
    x<<-y
    s<<-NULL
  }
  get<-function() x
  setsolve<- function(solve) s<<- solve()
  getsolve<- function() s
  list(set = set, get = get,
       setsolve=setsolve,
       getsolve=getsolve)
}


## This functions computes the inverse of the matrix object created in the matrix 
## returned by the makeCacheMatrix above. If the inverse of the matirx has already been
## calculated and the matrix has no changes, then the fucntions solve retrieve the inverse
## from the chache data

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        s<-x$getsolve()
        if(!is.null(s)){
          message("Retrieving cached data")
          return(s)
        }
        data<-x$get()
        s<-solve(data, ...)
        x$setsolve(s)
        s
}
