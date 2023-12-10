clc
clear

t = [0 10];
x0 = zeros(4, 1);


[t, y] = ode45('MechanicalSystem', t, x0);

plot(t, y)

