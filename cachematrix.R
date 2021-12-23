## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(myMatrix = matrix()) {
    inv.myMatrix <- NULL
    set <- function(s.myMatrix) {
        myMatrix <<- s.myMatrix
        inv.myMatrix <<- NULL
    }
    get <- function() myMatrix
    setInverse <- function(football) inv.myMatrix <<- football
    getInverse <- function() inv.myMatrix
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
    

    

    
        
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}




##Sandbox

myMatrix <- matrix(c(6,2,8,4), nrow = 2, ncol = 2)