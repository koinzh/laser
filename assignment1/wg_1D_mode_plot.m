% wg_1D_mode_profile.m - Calculate the 1D mode profile of a waveguide
% by Lukas Chrostowski, 2012
% See Yariv Photonics book, Chapter 3.2
% - function returns mode profiles for TE and TM modes (E, H components)
% usage, e.g.:
%  [y, TE_E, TE_H, TM_E, TM_H] = wg_1D_mode_plot (1.45e-6, 0.27e-6, 1.45, 2.61, 1.45, 100, 4)
%  plot (y, TE_E); 

function [y, TE_E, TE_H, TM_E, TM_H]= wg_1D_mode_plot (lambda, t, n1, n2, n3, pts, M)

[nTE,nTM,TEparam,TMparam]= wg_1D_neff(lambda,t,n1,n2,n3);
y1=linspace( -M*t, -t/2, pts); 
y2=linspace( -t/2, t/2, pts); y2 = y2(2:end);
y3=linspace( t/2, M*t, pts);  y3 = y3(2:end);
y=[y1 y2 y3];
nx=[n1*ones(pts,1); n2*ones(pts-1,1); n3*ones(pts-1,1)]';
mu0=4*pi*1e-7; epsilon0=8.85e-12; eta=sqrt(mu0/epsilon0); c=3e8; % constants
for i=1:length(nTE)
    h=TEparam(i,2);q=TEparam(i,3); p=TEparam(i,4);
    beta = 2*pi*nTE(i)/lambda;
    C=2*h*sqrt ( 2*pi*c/lambda*mu0 / (beta * (t+1/q+1/p)*(h^2+q^2) ) ); % normalize to 1W
    % n1, n2, n3 regions
    TE_E(i,:)=C*[exp(q*(y1+t/2)), (cos(h*(y2+t/2))+q/h*sin(h*(y2+t/2))), (cos(h*t)+q/h*sin(h*t)).*exp(-p*(y3-t/2))];
end
TE_H=TE_E'.*(nx'*ones(1,length(nTE)))/eta;

for i=1:length(nTM)
    h=TMparam(i,2); q=TMparam(i,3);
    p=TMparam(i,4); qb=n2^2/n1^2*q;pb=n2^2/n3^2*p;
    beta = 2*pi*nTM(i)/lambda;
    temp=(qb^2+h^2)/qb^2 * (t/n2^2 + (q^2+h^2)/(qb^2+h^2)/n1^2/q + ( p^2+h^2)/(p^2+h^2)/n3^2/p) ;
    C=2*sqrt ( 2*pi*c/lambda*epsilon0 / (beta * temp )); % normalize to 1W
    TM_H(i,:)=C*[h/qb*exp(q*(y1+t/2)), (h/qb*cos(h*(y2+t/2))+sin(h*(y2+t/2))), (h/qb*cos(h*t)+sin(h*t)).*exp(-p*(y3-t/2))];
end
TM_E=TM_H'./(nx'*ones(1,length(nTM)))*eta;
