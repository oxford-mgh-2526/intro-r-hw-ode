#' ODE function for a Lotka-Volterra model
#' The Lotka-Volterra model describes the dynamics of two interactive
#' species (predator and prey) in an ecological system, and contains a pair of equations.
#' dx/dt = a * x - b * x * y
#' dy/dt = c * x * y - d * y
#' This function is designed to work with the deSolve::ode function
func_lv <- function(t, state, parms) {
    x <- state["x"]
    y <- state["y"]
    
    a <- parms["a"]
    b <- parms["b"]
    c <- parms["c"]
    d <- parms["d"]
    
    dx <- a * x - b * x * y
    dy <- c * x * y - d * y
    return(list(c(dx, dy)))

}

if (FALSE) {
    out <- deSolve::ode(
        y = c("x" = 1, "y" = 1), times = seq(1, 40, 0.01), func = func_lv,
        parms = c("a" = 2/3, "b" = 4/3, "c" = 1, "d" = 1), method = "euler"
    )
    head(out)
    plot(out)
    plot(out[, "x"], out[, "y"], type = "l")
}