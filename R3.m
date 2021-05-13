% R3 Batteri beräkning
clc
clear all
format long

A = 85; % Batteriets kapacitet i kWh;
c = 0.99975; % Kapacitetsförlust 0.0025 %
P = 2; % Kokplattans effekt i kWh
EX = ones(365,1);
EX(end) = 2;
EY = ones(365,1);
EY(1) = A;

tempX = A;
nc = 0;
for i = 1:2:364
    nc = nc + 1;
   EX(i) = tempX*c;
   EX(i+1) = tempX*c;
   tempX = tempX*c;
end
EX(end) = tempX*c;

tempY = A;
for i = 2:2:365
   EY(i) =  tempY*c;
   EY(i+1) = tempY*c;
   tempY = tempY*c;
end

TX = EX./P;
TY = EY./P;

T = repelem(flipud(unique(TY)),2);
sum(T)

j = 1;

while sum(T(1:j)) < 8760
    j = j+1;
end

sum(T(1:j))