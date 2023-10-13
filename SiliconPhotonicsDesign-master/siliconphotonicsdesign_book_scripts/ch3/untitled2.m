% wg_1D_slab.lsf - setup the Lumerical MODE 1D simulation
wg_2D_draw; % draw the waveguide
wavelength=1.55e-6;
meshsize = 10e-9; % mesh size
% add 1D mode solver (waveguide cross-section)
addfde; set("solver type","1D Z:X prop");
set("x", 0); set("y", 0);
set("z max", Zmax); set("z min", Zmin);
set("wavelength", wavelength);
set("define z mesh by","maximum mesh step");
set("dz", meshsize);
modes=2; % modes to output
set("number of trial modes",modes)
