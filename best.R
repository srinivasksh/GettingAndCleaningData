best <- function(state, outcome) {
    ## Read outcome data
    outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## extract unique array of states
    states <- unique(outcome_data[, 7])
    
    ## create array of outcomes
    outcome_list <- c("heart attack", "heart failure", "pneumonia")
    
    ## check if its a valid state
    if(!is.element(state, states)) stop('invalid state')
    
    ## check if its a valid outcome
    if(!is.element(outcome, outcome_list)) stop('invalid outcome')
    
    ifelse(outcome == "heart attack", outcome_col <- 11, ifelse(outcome == "heart failure", outcome_col <- 17, outcome_col <- 23))
    
    outcome_state_tmp <- subset(outcome_data, State == state)
    
    outcome_state <- subset(outcome_state_tmp, !outcome_state_tmp[,outcome_col] == "Not Available")
    
    idx <- which.min(as.double(outcome_state[,outcome_col]))
    
    outcome_state[idx,"Hospital.Name"]
}