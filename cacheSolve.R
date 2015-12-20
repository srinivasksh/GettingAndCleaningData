cacheSolve <- function(x, ...) {
    
    ## Assign getInv column of dataframe : cached data
    Inv <- x$getInv()
    
    ## Check if cached variable is already available
    if(!is.null(Inv)) {
        message("getting cached data")
        return(Inv)
    }
    
    ## get the matrix data
    data <- x$get()
    
    ## calculate Inverse of the input matrix
    Inv <- solve(data, ...)
    
    ## cache the inverse to x dataframe
    x$calcInv(Inv)
    
    ## return the Inverse
    Inv
}