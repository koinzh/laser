% n_core, refractive of the core medium
% n_clad, refractive of cladding
% lambda, wavelength, (nm)
% m, e.g.calculate dcutoff of TM1, m=1
% usage: 
% - get dcutoff of TM waveguide
% - [d_cutoff] = dtmcutoff(1.45, 2.61, 1480,1);

function [d_cutoff] = dtmcutoff(n_clad, n_core, lambda,m)

% calculate d_cutoff
k0 = lambda / ( 2 * pi );
kc = sqrt(n_core^2 - n_clad^2); 
ka = sqrt(n_core^2);
kb = atan(sqrt(n_core^2/n_clad^2-1));
d_cutoff = m * k0 * kc * kb / ka; 

end


