s_0 = 99;
i_0 =  1;
r_0 =  0;

beta = 1/90;
gamma = 1/2;
mu = 0;
lambda = 1/270;

num_steps = 70;

[s_n, i_n, r_n, W] = sir_simulate_project(s_0, i_0, r_0, beta, gamma, lambda, mu, num_steps);

% Plot
figure(1); clf; hold on;
plot(W, s_n); label1 = "Susceptible";
plot(W, i_n); label2 = "Infected";
plot(W, r_n); label3 = "Recovered";

plot(s_n + i_n + r_n); label4 = "Total People";

xlabel("Week")
ylabel("Persons")
legend({label1, label2, label3, label4})