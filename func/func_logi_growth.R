#' ODE function for a logistic growth model
#' This function is designed to work with the deSolve::ode function
func_logi_growth <- function(t, state, parms) {
    dP <- parms["r"] * state["p"] * (1 - (state["p"]/parms["k"]))
    return(list(c(dP)))
}
#I
#initial_state1 <- c(P=0)

#P
#parameters <- c(r = 1, k = 5000)

#T
#tps <- seq(0, 100, by = 0.01) 


if (FALSE) {
    out <- deSolve::ode(
        y = c("p" = 10), times = seq(1, 100, 0.1), func = func_logi_growth,
        parms = c("r" = 0.1, "k" = 1000), method = "euler"
    )
    plot(out)
}

