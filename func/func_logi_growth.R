#' ODE function for a logistic growth model
#' This function is designed to work with the deSolve::ode function
func_logi_growth <- function(t, state, parms) {
    dp <- parms["r"] * state["p"] * (1 - state["p"] / parms["k"])
    return(list(c(dp)))
}

if (FALSE) {
    
}