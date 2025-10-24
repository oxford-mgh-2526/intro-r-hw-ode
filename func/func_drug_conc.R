#' ODE function for a two-compartment pharmacokinetic model
#' This model describes how a drug distributes throughout the body over time.
#' The initial dose of the drug is given to a central compartment e.g. blood, stomach.
#' Over time the drug is absorbed in to a peripheral compartment e.g. liver, muscle
#' The model contains a pair of equations.
#' dx/dt = -r1 * x
#' dy/dt = r1 * x - r2 * y
#' This function is designed to work with the deSolve::ode function
func_drug_conc <- function(t, state, parms) {
    with(as.list(c(state, parms)), {
        dx <- -r1 * x
        dy <- r1 * x - r2 * y
        
        return(list(c(dx, dy)))
    })
}
if (TRUE) {
    out <- deSolve::ode(
        y = c("x" = 1, "y" = 0), times = seq(1, 40, 0.01), func = func_drug_conc,
        parms = c("r1" = 1/2, "r2" = 1/10), method = "euler"
    )
    plot(x ~ time, data = out, type = "l")
    lines(y ~ time, data = out)
}

