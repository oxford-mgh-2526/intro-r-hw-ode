func_logi_growth <- function(t, state, parms) {
    dp <- parms["r"] * state["p"] * (1 - state["p"] / parms["k"])
    return(list(c(dp)))
}