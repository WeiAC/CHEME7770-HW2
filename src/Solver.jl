# ----------------------------------------------------------------------------------- #
# estimate_steady_state: estimates the steady-state vector for the dynamic system
#
# Type: GRN-JULIA
# Version: 1.0
#
# Input arguments:
# problem  - dictionary instance (holds model parameters)
#
# Return arguments:
# XSS - steady state vector
# ----------------------------------------------------------------------------------- #
function estimate_steady_state(problem::Dict{String,Any})

    # Get the initial conditions -
    initial_condition_array = problem["initial_condition_array"];

    # calculate the steady-state soln -
    steady_state_prob = SteadyStateProblem(Balances, initial_condition_array, problem)
    steady_state_soln  = solve(steady_state_prob, DynamicSS(AutoTsit5(Rosenbrock23(autodiff=false));abstol=1e-8,reltol=1e-6,tspan=Inf))

    # return -
    return abs.(steady_state_soln.u)
end
