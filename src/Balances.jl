function Balances(dx,x,problem,t)

    # alias -
    mRNA = x[1]
    G = x[2]
    σ70 = x[3]

    # calculate kinetics -
    transcription_kinetics = calculate_transcription_kinetics(t,x,problem)
    degradation_kinetics = calculate_mRNA_degradation_kinetics(t,x,problem)

    # compute the control -
    u_variable = calculate_transcriptional_control_array(t,x,problem)

    # compute the material balances -
    dx[1] = transcription_kinetics*u_variable - degradation_kinetics    # mRNA balances
    dx[2] = 0   # G
    dx[3] = 0   # σ70
end