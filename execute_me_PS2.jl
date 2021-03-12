# PS2 CHEME 5440/7770 Cornell University
# 
# instructions:
# To execute this script execute the command (from the Julia REPL):
# julia> include("execute_me_PS2.jl")

# load the include file -
include("Include.jl")

# main method -
function main(parameters_file_path::String, inducer_array::Array{Float64,1})::Array{Float64,2}

    # initialize -
    number_of_inducer_levels = length(inducer_array)
    mRNA_steady_state_array = Array{Float64,2}(undef,number_of_inducer_levels,2)

    try 

        # load the parameter file, and create the problem dictionary -
        problem_dictionary = generate_problem_dictionary(parameters_file_path)

        # For PS2, we are calculating the steady state level of mRNA as a function of inducer -
        initial_condition_array = problem_dictionary["initial_condition_array"]
        for (index, inducer_level) in enumerate(inducer_array)
            
            # set the inducer concentration -
            initial_condition_array[3] = inducer_level
            problem_dictionary["initial_condition_array"] = initial_condition_array

            # estimate the steady state -
            XSS = estimate_steady_state(problem_dictionary)            
        
            # capture the steady state mRNA -
            mRNA_steady_state_array[index,1] = inducer_level
            mRNA_steady_state_array[index,2] = XSS[1]
        end

        # return -
        return mRNA_steady_state_array
    catch error

        # grab the error message, and post -
        @error "Oooops! Hmmmmm. Something happend" exception=(error, catch_backtrace())
    end
end

# setup the path to the parameters file -
path_to_parameters_file = joinpath(_PATH_TO_CONFIG, "Parameters.toml")

# setup the inducer array: units of nM
inducer_array = 10 .^(range(-3,stop=3, length=100))

# execute -
mRNA_steady_state_array = main(path_to_parameters_file, inducer_array)

#to plot - uncomment me -
plot(mRNA_steady_state_array[:,1],mRNA_steady_state_array[:,2], xscale=:log10, legend=false)
xlabel!("Inducer concentration (nM)")
ylabel!("Steady state mRNA concentration (uM)")