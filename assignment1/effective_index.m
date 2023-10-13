
% Define the waveguide parameters
d_cutoff= 3.41;% core radius (um)
n1 = 2.61;        % core refractive index
n2 = 1.45;       % cladding refractive index
lambda = 1.48;   % wavelength (um)

% Layer heights:
h1 = 2.0;           % Lower cladding
h2 = 2.7280;           % Core thickness
h3 = 2.0;           % Upper cladding
% Horizontal dimensions:
rh = 1.1;           % Ridge height
rw = 1.0;           % Ridge half-width
side = 1.5;         % Space on side
% Grid size:
dx = 0.0125;        % grid size (horizontal)
dy = 0.0125;        % grid size (vertical)
% lambda = 1.55;      % vacuum wavelength
nmodes = 1;         % number of modes to compute
[x,y,xc,yc,nx,ny,eps,edges] = waveguidemesh([n2,n1,n2],[h1,h2,h3], ...
                                            rh,rw,side,dx,dy); 

% First consider the fundamental TE mode:
[Hx,Hy,neff] = wgmodes(lambda,n1,nmodes,dx,dy,eps,'000A');
fprintf(1,'neff = %.4f\n',neff);
figure(1);
subplot(121);
contourmode(x,y,Hx);
title('Hx (TE mode)'); xlabel('x'); ylabel('y'); 
for v = edges, line(v{:}); end
subplot(122);
contourmode(x,y,Hy);
title('Hy (TE mode)'); xlabel('x'); ylabel('y'); 
for v = edges, line(v{:}); end

% Calculate the effective index of the fundamental TE mode
%a = d_cutoff * 0.8;
%neff = wgmodes(lambda,a,n1,n2,'TE',0);

% output
%fprintf('effective_index= %.0f\n', neff); % effective_index

% Generate the plot of Ex as a function of y
%teplot(lambda,a,n1,n2,neff,'TE',0);
