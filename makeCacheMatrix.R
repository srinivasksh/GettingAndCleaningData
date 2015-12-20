makeCacheMatrix <- function(x = numeric()) {
    ## Initialize Inv variable
    Inv <- NULL
    set <- function(y) {
        x <<- y
        Inv <<- NULL
    }
    get <- function() x
    
    ## calcInv column variable
    calcInv <- function(solve) Inv <<- solve
    
    ## getInv column variable
    getInv <- function() Inv
    
    ## create a list of set, get, calcInv, and getInv varables
    list(set = set, get = get, 
         calcInv = calcInv, 
         getInv = getInv)
}