#' ODE function for a Lotka-Volterra model
#' The Lotka-Volterra model describes the dynamics of two interactive
#' species (predator and prey) in an ecological system, and contains a pair of equations.
#' dx/dt = a * x - b * x * y
#' dy/dt = c * x * y - d * y
#' This function is designed to work with the deSolve::ode function
func_lv <- function(t, state, parms) {
    # implement this function here
    dx<-parms["a"]*state["x"]-parms["b"]*state["x"]*state["y"]
    dy<-parms["c"]*state["x"]*state["y"]-parms["d"]*state["y"]
    return(list(c(dx,dy)))
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