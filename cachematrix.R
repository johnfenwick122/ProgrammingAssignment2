## Put comments here that give an overall description of what your
## functions do: ...

### These two functions work together, to cache a special matrix and
### then solve for the inverse of the matrix using the a second function
### that has access to the environment of the first function.
### In a way these two functions can talk to each other in a
### shared parent envirnment. This is done by using the '<<-' double 
### back arrow operator; which assigns an object to an environment
### one level up.

## Write a short comment describing this function ...

### This first function makeCacheMatrix() stores a special matrix 
### of type makeCacheMatrix. Assume that this function only takes
### an invertable matrix.
### This first will also return a list of four functions; that 
### need to passed data type makeCacheMatrix

makeCacheMatrix <- function(x = matrix()) {
        
        m <- NULL
        
        set <- function(y){
                x <<- y
                m <<- NULL
        }
        
        get <- function() { x }
        
        setsolve <- function(solve) { m <<- solve }
        
        getsolve <- function() { m }
        
        list(set = set,
             get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


## Write a short comment describing this function ...

### This next function cacheSolve() takes a special matrix of type makeCacheMatrix
### and returns the inverse if one is not already stored.

### see below "Example" for demo:

cacheSolve <- function(x, ...) {
        
        m <- x$getsolve()
        if (!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        my_mat <- x$get()
        m <- solve(my_mat, ...)
        x$setsolve(m)
        m
}

####################################
###### "Example" ###################
####################################

### make an invertable matrix

a_m <- matrix(data = c(1,2,3,4,5,
                       2,3,4,5,1,
                       3,4,5,1,2,
                       4,5,1,2,3,
                       5,1,2,3,4), nrow = 5)

### create a special matrix of type makeCacheMatrix
my_matrix <- makeCacheMatrix(x = a_m)

### check and see if the matrix is there
my_matrix$get()

### pass the special matrix to cacheSolve to
### compute the inverse of the matrix.
cacheSolve(my_matrix)


