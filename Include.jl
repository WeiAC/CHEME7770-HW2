# setup path -
_PATH_TO_PROJECT = pwd()
_PATH_TO_SRC = joinpath(_PATH_TO_PROJECT, "src")
_PATH_TO_CONFIG = joinpath(_PATH_TO_PROJECT, "config")

# import PKG, activate the project and instaintiate -
import Pkg
Pkg.activate(_PATH_TO_PROJECT)
Pkg.instantiate()

# load packages -
using DifferentialEquations
using Plots
using LaTeXStrings
using TOML
using Logging

# my codes -

# Problem.jl
path_to_problem = joinpath(_PATH_TO_SRC,"Problem.jl")
include("$(path_to_problem)")

# Balances.jl
path_to_balances = joinpath(_PATH_TO_SRC,"Balances.jl")
include("$(path_to_balances)")

# Control.jl
path_to_control = joinpath(_PATH_TO_SRC,"Control.jl")
include("$(path_to_control)")

# Kinetics.jl
path_to_kinetics = joinpath(_PATH_TO_SRC,"Kinetics.jl")
include("$(path_to_kinetics)")

# Solver.jl
path_to_solver = joinpath(_PATH_TO_SRC,"Solver.jl")
include("$(path_to_solver)")