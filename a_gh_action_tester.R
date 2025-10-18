rm(list = ls())

library("deSolve")

# 1 - Differential equation
# source(file.path("func", "func_logi_growth.R"))
source(file.path("func", "func_logi_growth_answer.R"))

logi_k <- 5000
p0 <- 1
exp_r <- 0.2

t_last <- 100
t_intr <- 0.1

# 2 - Initial state
init_state_1 <- c("p" = p0)
init_state_2 <- c("p" = logi_k * 1.8)

# 3 - Parameters
parameters <- c("r" = exp_r, "k" = logi_k)

# 4 - Time
tps <- seq(0, t_last, by = t_intr)

# 5 - Ode (model integration)
out_logi_1_this <- deSolve::ode(
    y = init_state_1, times = tps, func = func_logi_growth,
    parms = parameters, method = "euler"
)
out_logi_2_this <- deSolve::ode(
    y = init_state_2, times = tps, func = func_logi_growth,
    parms = parameters, method = "euler"
)
# save(out_logi_1, out_logi_2, file = file.path("check", "out_logi.RData"))
load(file.path("check", "out_logi.RData"))

stopifnot(isTRUE(all.equal(out_logi_1, out_logi_1_this)))
print("out_logi_1 is good. passed 1/2")
stopifnot(isTRUE(all.equal(out_logi_2, out_logi_2_this)))
print("out_logi_2 is good. passed 2/2")
