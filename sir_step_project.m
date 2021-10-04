function [s_n, i_n, r_n] = sir_step_project(s, i, r, beta, gamma, lambda, mu, step)
% fcn_step Advance an SIR model one timestep
%
% Usage
%   [s_n, i_n, r_n] = sir_step_project(s, i, r, beta, gamma, lambda, mu, step)
% 
% Arguments
%   s = current number of susceptible individuals
%   i = current number of infected individuals
%   r = current number of recovered individuals
%   
%   beta = infection rate parameter
%   gamma = recovery rate paramter
%   lamda = reinfection rate parameter
%   mu = vaccination rate paramter
%
% Returns
%   s_n = next number of susceptible individuals
%   i_n = next number of infected individuals
%   r_n = next number of recovered individuals

% Calculate infected and recovered
infected  = beta*s*i;
recovered = gamma*i;

% Update state 1/2
s_n = s - infected;
i_n = i + infected - recovered;
r_n = r + recovered;

%Calculate vaccinated and reinfected
vaccinated = mu*s_n;
reinfected = lambda*r_n*i_n;

% Update state 2/2
s_n = s_n - vaccinated + reinfected;
i_n = i_n;
r_n = r_n - reinfected + vaccinated;