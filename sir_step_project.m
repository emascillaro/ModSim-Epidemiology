function [s_n, i_n, r_n] = sir_step_project(s, i, r, beta, gamma, lambda, mu, step)
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

%


%

%if step <= 999

s_n = s - beta*s*i - mu*s + lambda*r*i;
i_n = i + beta*s*i - gamma*i;
r_n = r + gamma*i - lambda*r*i + mu*s;

%{
else
s_n = s - beta*s*i - mu*s + lambda*r*(400/step);
i_n = i + beta*s*i - gamma*i;
r_n = r + gamma*i - lambda*r*(400/step) + mu*s;
%}

%end

%{
if step <= 14;
    s_n = s - beta*s*i - mu*s;
    i_n = i + beta*s*i - gamma*i;
    r_n = r + gamma*i + mu*s;  
    disp(step);
%Dumping all recovered back into susceptible
%elseif (step == 15)
%    s_n = s - beta*s*i - mu*s;
%    i_n = i + beta*s*i - gamma*i;
%    r_n = r + gamma*i + mu*s;  
%    s_n = s_n + r_n;
%    r_n = 0;
%    disp(':)')
else
    s_n = s - beta*s*i - mu*s + lambda*r;
    i_n = i + beta*s*i - gamma*i;
    r_n = r + gamma*i - lambda*r + mu*s;
end 
%}

% This way of enforcing invariants does not actually conserve persons!
%s_n = max(s_n, 0);
%i_n = max(i_n, 0);
%r_n = max(r_n, 0);
    
end