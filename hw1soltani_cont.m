%Maryam Soltani%
clear all
clc
close all
t=0.005;
w=0.1;
L=0.05;
H=150;
k=370;
T0=30;
Tb=250;
P=2*(w+t);
A_c=w*t;
m=sqrt(H*P/(k*A_c));

x=0.05;
c2 = Tb-T0;
c1 = -(Tb-T0)*(cosh(m*L)+k*m*sinh(m*L))/(+k*m*cosh(m*L)+H*sinh(m*L));
Fun = c1*sinh(m*x)+c2*cosh(m*x);
d2Fun = c1*(m^2)*sinh(m*x)+c2*(m^2)*cosh(m*x);

dx = [0.05, 0.025, 0.01, 0.001, 0.0001,0.00001]; 

for i=1:length(dx)
           
     %with analytical
     second(i)= ((c1*sinh(m*(x-dx(i)))+c2*cosh(m*(x-dx(i))))-2*(c1*sinh(m*x)+c2*cosh(m*x))+c1*sinh(m*(x+dx(i)))+c2*cosh(m*(x+dx(i))))/((dx(i))^2)
     error_second_order = abs(d2Fun-second);
     %without analytical
     Y = - diff (second)
     X = - diff (dx)
     
end

figure (1);
loglog(dx,error_second_order,'linewidth',1.6);
title('Error Compared With Analytical Answer')
xlabel('dx');
ylabel('True Truncation Error');

figure (2);
loglog(X,Y,'linewidth',1.6);
xlabel('dx');
ylabel('Successive Error');
title('Successive Error')

