## The following two functions, makeCacheMatrix and cacheSolve work together
## to use lexical scoping to calculate the inverse of a matrix, and cache
## the value of the matrix. If the inverse of the matrix is asked for repeatedly
## without changing the original matrix, then it is not recalculated, 
## the cached value of the inverse matrix is used.


## makeCacheMatrix function (below) creates a list of 4 getters/setters functions
## the output (list) should be assigned to an object that will be input to cacheSolve

makeCacheMatrix <- function(myMatrix = matrix()) {
    inv.myMatrix <- NULL
    set <- function(s.myMatrix) {
        print ("updated input matrix")  # notify matrix is updated
        myMatrix <<- s.myMatrix
        print(myMatrix) # display updated matrix
        inv.myMatrix <<- NULL
    }
    get <- function() myMatrix
    setInverse <- function(football) inv.myMatrix <<- football
    getInverse <- function() inv.myMatrix
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
#this output list is a list of 4 named functions
}

## cacheSolve function (below) has object created by function above as input.
## it first calls for the inverse matrix value stored in the closure of makeCacheMatrix()
## and tests if it is null. if it's not null, then it uses that value without recalculating
## if it is null, it calculates the inverse then it stores that value
## in the closure of makeCacheMatrix by calling the setInverse() subfunction.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    amInull <- x$getInverse()      #x, a list of 4 functions is formal arg for cacheSolve. A list is input so list becomes x. 
    if(!is.null(amInull)) {
        message("getting cached data")
        return(amInull)         #amInull is the value of the cached inv.myMatrix so this works
    }
                                #if the cache is not null then the cached matrix is returned
                                #and the code below this line is not executed.
                                #if the cache IS null, the code below IS executed.    
    
    newdata <- x$get()      #runs the get function from the list x an assigns the matrix to newdata
    rugby <- solve(newdata, ...) #takes inverse of matrix and assigns to rugby
    x$setInverse(rugby)     #sends inverse matrix value from rugby to football (above) 
                            #then to inv.myMatrix in above parent frame (to cache)
    print(rugby)        ## this prints the new (not cached) inverse matrix.        
}


##
## Dear Grader, 
##
## Please use the following commands (or something similar) to test this:
##
## first run the code (highlight it all and click 'run' in Rstudio)
## then please run the following commands in the console:
##
## testmtx <- matrix(c(6,2,8,4),2,2) #this is a 2*2 matrix to be inverted.
## print(testmtx) # to see the matrix just created
## myMatrix_object <- makeCacheMatrix(testmtx) #list of 4 getters/setters functions
## cacheSolve(myMatrix_object)  # the first time run, should be no "cached" message
## cacheSolve(myMatrix_object)  # the second time run, SHOULD be a "cached" message
##
## new.matrix <- matrix(c(3,1,7,5),2,2) # this creates a new different matrix
## myMatrix_object$set(new.matrix) # this loads the new matrix into the function 
##        ## the set() function will give an update message and print the new matrix
## cacheSolve(myMatrix_object)  # inverts updated matrix (no "cached" message)
## cacheSolve(myMatrix_object)  # the second time run, SHOULD be a "cached" message
##
## 
## This was created using R version 4.1.2
## 
## Thank you.
##
        

