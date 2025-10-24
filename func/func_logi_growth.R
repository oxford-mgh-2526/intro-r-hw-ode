#' ODE function for a logistic growth model
#' This function is designed to work with the deSolve::ode function
#' 
rm(list= ls())

func_logi_growth <- function(t, state, parms) {
    dP <- parms["r"] * state ["p"] * (1 - (state["p"]/parms["k"]))
 return(list(c(dP)))
}

if (FALSE) {
    out <- deSolve::ode(
        y = c("p" = 10), times = seq(1, 100, 0.1), func = func_logi_growth,
        parms = c("r" = 0.1, "k" = 1000), method = "euler"
    )
    plot(out)
}


