clc
clear

FlowRate =...
   [120;
    150;
    180;
    200;
    250;
    300;
    320;
    340;
    380;
    400;
    450;
    500;
    550;
    600;
    650;
    700;
    750;
    800;];
Height =...
    [13;
    17;
    20;
    25;
    30;
    34;
    35;
    39;
    41;
    44;
    50;
    53;
    58;
    62;
    66;
    69;
    72;
    78;];

model = fit(FlowRate, Height, 'poly1');

fprintf('\nMean value of Height: %f', mean(Height))
fprintf('\nMean value of FlowRate: %f', mean(FlowRate))
fprintf('\nStandard deviation of Height: %f', std(Height))
fprintf('\nStandard deviation of FlowRate: %f\n', std(FlowRate))

plot(model, FlowRate, Height);

coeff = coeffvalues(model)

y = [coeff(1).*FlowRate + coeff(2)];

Sres = ((sum((Height - y).^2))/16)^(1/2);
j = sum((Height - y).^2);



fprintf('J is: %f', j)
fprintf('J is: %f', j^(1/2))


fprintf('\nResidual standard deviation %f \n', Sres);
