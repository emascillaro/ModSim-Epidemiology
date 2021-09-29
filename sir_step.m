function [s_n, i_n, r_n] = sir_step(s, i, r, beta, gamma)
% fcn_step Advance an SIR model one timestep
%
% Usage
%   [s_n, i_n, r_n] = fcn_step(s, i, r, beta, gamma)
% 
% Arguments
%   s = current number of susceptible individuals
%   i = current number of infected individuals
%   r = current number of recovered individuals
%   
%   beta = infection rate parameter
%   gamma = recovery rate paramter
% 
% Returns
%   s_n = next number of susceptible individuals
%   i_n = next number of infected individuals
%   r_n = next number of recovered individuals

% compute new infections and recoveries
infected = beta * i * s;
recovered = gamma * i;
    
% Update state
s_n = s - infected;
i_n = i + infected - recovered;
r_n = r + recovered;

% Enforce invariants; necessary since we're doing a discrete approx.
s_n = max(s_n, 0);
i_n = max(i_n, 0);
r_n = max(r_n, 0);
    
end