% n_core, refractive of the core medium
% n_clad, refractive of cladding
% lambda, wavelength, (nm)
% m, e.g.calculate dcutoff of TE1, m=1
% usage: 
% - get dcutoff of TE waveguide
% - [d_cutoff] = dtemcutoff(1.45, 2.61, 1480,0);

function [d_cutoff] = dtemcutoff(n_clad, n_core, lambda,m)

% calculate d_cutoff
k0 = lambda / 2;
kc = sqrt(n_core^2 - n_clad^2); 
d_cutoff = m * k0 / kc; 

end


