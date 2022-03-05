% Maryam Soltani%
clc
clear all
close all
format long

%%%data
t=0.005;
w=0.1;
L=0.05;
H=150;
k=240;
T0=30;%C
Tb=370;%C
P=2*(w+t);
A_c=w*t;
m=sqrt(H*P/(k*A_c));

dx1=[0.05,0.025,0.02,0.01,0.005,0.001,0.0001];   ddx1=dx1.*dx1;

 s=char('k --','r -.','g -','b :','m','c --','k :','y -.');


for i=1:length(dx1) %% vase mohasebe  be ezaye gamhaye mokhtalef
    
   x1=0:dx1(i):L;%%toole gam 
   N=length(x1);
   u=zeros(1,N);   d=zeros(1,N);   l=zeros(1,N);   n=zeros(1,N);
   
    u(1)=0; u(N)=0;
    l(1)=1; l(N)=-1;
    d(1)=1; d(N)=(H/k)*dx1(i)+1;
          for j=2:N-1
                l(j)=1;  d(j)=-m^2*ddx1(i)-2;   u(j)=1;
          end
    m1=showmatrix(l,d,u)
    n(1)=Tb;
    TT=TDMAmethod(m1,n)
    
     plot(x1,TT,s(i,:),'linewidth',1.2)
    
            hold on
            xlabel('x_m[m]')
            ylabel('T[{\circC}]')
            legendInfo{i}=['\Deltax=',num2str(dx1(i)),'m']
            legend(legendInfo)
%             axis([0,0.05*2,180,251])        
           
end

%%Analytical
xx=0:0.001:L;
c2=Tb-T0;
c1=-(Tb-T0)*(H*cosh(m*L)+k*m*sinh(m*L))/(+k*m*cosh(m*L)+H*sinh(m*L));
F=c1*sinh(m*xx)+c2*cosh(m*xx);
plot(xx,F+T0,'linewidth',1.6)
title('Numerical and Analytical Answers')

