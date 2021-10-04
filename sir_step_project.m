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
infected  = beta*s*i;
recovered = gamma*i;

% Enforce invariants 1
%total = s + i + r;
%infected = min(s, infected);           % Cannot infect more people than current s
%infected = min(total - i, infected);   % Cannot infect more than total
%recovered = min(i, recovered);         % Cannot recover more people than current i
%recovered = min(total - r, recovered); % Cannot recover more than total


% Update state 1
s_n = s - infected;
i_n = i + infected - recovered;
r_n = r + recovered;

vaccinated = mu*s_n;
reinfected = lambda*r_n*i_n;

% Enforce invariants 2
%total = s_n + i_n + r_n;
%vaccinated = min(s_n, vaccinated);           % Cannot vaccinate more people than current s
%vaccinated = min(total - r_n, vaccinated);   % Cannot vaccinate more than total
%reinfected = min(r_n, reinfected);         % Cannot reinfecte more people than current r
%reinfected = min(total - i_n, reinfected); % Cannot reinfecte more than total

% Update state 2
s_n = s_n - vaccinated + reinfected;
i_n = i_n;
r_n = r_n - reinfected + vaccinated;


%Previously:
%s_n = s - beta*s*i - mu*s + lambda*r*i;
%i_n = i + beta*s*i - gamma*i;
%r_n = r + gamma*i - lambda*r*i + mu*s;

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