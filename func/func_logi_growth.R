#' ODE function for a logistic growth model
#' This function is designed to work with the deSolve::ode function
func_logi_growth <- function(t, state, parms) {
    # implement this function here
    p <- state["p"]        # current population
    r <- parms["r"]        # intrinsic growth rate
    k <- parms["k"]        # carrying capacity
    
    dp <- r * p * (1 - p / k)
    
    return(list(c(dp)))
}

if (FALSE) {
    out <- deSolve::ode(
        y = c("p" = 10), times = seq(1, 100, 0.1), func = func_logi_growth,
        parms = c("r" = 0.1, "k" = 1000), method = "euler"
    )
    plot(out)
}

