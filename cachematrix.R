# These functions use another environment to cache de inverse
# of a matrix wich can be a time consuming operation

## makeCacheMatrix is a function that constructs a list of functions to:
## set - this function copies the matrix to another environment and 
##       signals that the inverse has not been calculated yet.
## get - this function retrieves the matrix from the environmet
## setinverse - this function copies the inverse matrix in the environment
## getinverse - this function retrieves the inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
        inverse <- NULL
        set <- function(y) {
                x <<- y
                inverse <<- NULL
        }
        get <- function() x
        setinverse <- function(m) inverse <<- m
        getinverse <- function() inverse
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## cacheSolve is a function to retrieve the inverse of a matrix stored
## in another environment.
## if the inverse has not been calculated, cacheSolve will calcutate 
## and cache it

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse<-x$getinverse()       ##retrieves the inverse matrix
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        data <- x$get()            ##retrieves matrix as data
        inverse <- solve(data,...) ##calculate inverse of data
        x$setinverse(inverse)      ##cache the calculated inverse
        inverse
}
