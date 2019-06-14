# Function creates a special matrix object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setInv <- function(inverse) i <<- inverse
  getInv <- function() i
  list(set = set,
       get = get,
       setInv = setInv,
       getInv = getInv)
}


## This function computes the inverse of the matrix created by makeCacheMatrix function. If inverse alread exists then it should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  i <- x$getInv()
  if (!is.null(i)) {
    message("getting cached data")
    return(i)
  }