#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly=TRUE)

stopifnot(length(args) >= 1)
model_name <- args[1]

print(paste0("Checking model:", model_name))

# model_name <- "logi_growth"
# model_name <- "lv"
# model_name <- "drug_conc"

tps <- seq(0, 50, 0.1)

# ----
library("deSolve")

func_file <- file.path("func", paste0("func_", model_name,".R"))
func_answer_file <- file.path("func", paste0("func_", model_name,"_answer.R"))
run_with_answers <- file.exists(func_answer_file)
if (run_with_answers) {
    source(func_answer_file)
} else {
    source(func_file)
}

ls_init_state <- list(
    "logi_growth" = c("p" = 1),
    "lv"          = c("x" = 1, "y" = 1),
    "drug_conc"   = c("x" = 1, "y" = 0)
)
init_state <- ls_init_state[[model_name]]
ls_parameters <- list(
    "logi_growth" = c("r" = 0.3, "k" = 100),
    "lv"          = c("a" = 2/3, "b" = 4/3, "c" = 1, "d" = 1),
    "drug_conc"   = c("r1" = 1/3, "r2" = 1/5)
)
parameters <- ls_parameters[[model_name]]
out <- deSolve::ode(
    y = init_state, times = tps, func = get(paste0("func_", model_name)),
    parms = parameters, method = "euler"
)
# plot(out)
rdata_file <- file.path("check", paste0("out_", model_name, ".RData"))
if (run_with_answers) {
    out_answer <- out
    save(out_answer, file = rdata_file)
} else {
    load(rdata_file)
    stopifnot(isTRUE(all.equal(out, out_answer)))
    print(head(out))
    print("passed.")
}

