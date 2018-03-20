%Eric Johnson
%Homework 6 ASE 367K
clc; clear all; close all;

clMax = 1.24;
S = 232;
W = 11000;

h = 0:100:60000;
%T-D = 0 
Tt = 1400;
K = .073;
Cd0 = .023;
v = 200:10:900; 
rhot =7.0613E-4;
hd = zeros(1,length(v));
for i=1:length(v)
    rho0 = .01;
    for ii=1:1000
        L = W;
        T = Tt*(rho0/rhot);
        f = T - (.5*Cd0*rho0*S*v(i)^2) - ((2*K*L^2)/(rho0*S*v(i)^2));
        df = (Tt/rhot) -.5*Cd0*S*v(i) + ((2*K*L^2)/((rho0^2)*S*v(i)^2));
        rho1 = rho0 - (f/df);
        if( ii ~= 1 && abs(rho1 - rho0) < 1E-7)
           p = rho0/(1.4939E-6);
           hd(i) = log(p/2678.4)/(-4.8063E-5);
            disp('break');
            break;
        end
        rho0 = rho1;
        
    end
end

%stall speed
for i=1:length(h)
    vcl(i) = sqrt((2*W)/(clMax*density(h(i))*S));
end

%maximum aerodynamic pressure
qMax = 300;
for i=1:length(h)
    vq(i) = sqrt((2*qMax)/density(h(i)));
end
%mach limit
M = .81;
for i=1:length(h)
    vMach(i) = mach(h(i), M);
end


figure(1)
plot(v,hd)
hold on
plot(vcl,h)
hold on
plot(vq, h)
hold on
plot(vMach, h)
xlim([0 1000])
ylim([0 60000])
