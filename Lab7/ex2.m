clc
clear

time = ...
   [0.0;
    0.3;
    0.6;
    0.9
    1.2;
    1.5;
    1.8;
    2.1;
    2.4;
    2.7;
    3.0;];


Vder=...
[
  0.0048;
  0.4512;
  0.4524;
  0.2916;
  0.1212;
  -0.4220;
  -0.2943;
  -0.2205;
  -0.1222;
  -0.0963;
  -0.0611;];


  V =...
  [
  	0.0031;
    0.0639;
    0.2146;
    0.3214;
    0.3966;
    0.2860;
    0.1892;
    0.1203;
    0.0741;
    0.0465;
    0.0273;
  ];




  Pmas=...
[
  -0.8796;
  2.6633;
  3.8347;
  3.2975;
  2.5159;
  -2.3584;
  -2.0160;
  -1.8821;
  -1.4588;
  -1.4265;
  -1.2926;];


X = [V Vder];

P0 = ones(11, 1);

Xnew = [V Vder P0];

b = regress(Pmas, X);

bnew = regress(Pmas, Xnew);

Pcalc = b(1)*V + b(2)*Vder;

PcalcNew = bnew(1)*V + bnew(2)*Vder + bnew(3);

hold all
plot(time, Pcalc, 'r');grid;
plot(time, PcalcNew);
plot(time, Pmas, '-xb');
plot(time, V, 'g');
plot(time, Vder);
xlabel('Time');
ylabel('Pressure');
legend('Estimated values', 'Estimated values with P0', 'Measured values', 'V', 'Vder');




