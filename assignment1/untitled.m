% wg_1D_slab_neff_sweep.lsf - perform sweep mode calculations on the slab
% wg_1D_slab; % Draw waveguides and setup the simulation
thick_Si_list = (0:.01:.4)*1e-6; % sweep waveguide thickness
mode_list=1:4;
neff_slab = zeros(length(thick_Si_list), length(mode_list));
TE_pol = zeros(length(thick_Si_list), length(mode_list));
select("MODE");
set("number of trial modes",max(mode_list)+2);
for kk=1:length(thick_Si_list)
    switchtolayout;
    setnamed('waveguide','z max', thick_Si_list(kk));
    n=findmodes;
    for m=1:length(mode_list)
        neff_slab (kk,m) =abs( getdata ("MODE::data::mode"+num2str(m),"neff") );
        TE_pol(kk,m) = getdata("MODE::data::mode"+num2str(m),"TE polarization fraction");
        if ( TE_pol(kk,m) > 0.5 )
            pol = "TE";
        else
            pol = "TM";
        end
    end
end
plot ( thick_Si_list, neff_slab);
% matlabsave ("wg_mode_neff_sweep_slab"); % save the data for plotting in Matlab
