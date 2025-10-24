#' ODE function for a logistic growth model
#' This function is designed to work with the deSolve::ode function
func_logi_growth <- function(t, state, parms) {
    with(as.list(c(state, parms)), {
        dp <- r * p * (1 - p / k)
        return(list(c(dp)))
    })
}

if (TRUE) {
    out <- deSolve::ode(
        y = c("p" = 10), times = seq(1, 100, 0.1), func = func_logi_growth,
        parms = c("r" = 0.1, "k" = 1000), method = "euler"
    )
    plot(out)
}
