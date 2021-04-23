family( 'LUMI_SoftwareStack' )
-- add_property("lmod","sticky")

local module_root = os.getenv( 'LMOD_MODULE_ROOT' )
if module_root == nil then
  LmodError( 'The environment variable LMOD_MODULE_ROOT is not found but needed to find the components of the LUMI prototype.' )
end

whatis( 'CrayEnv restores the typical Cray Environment rather than using one of the LUMI software stacks.' )

help( [==[

Description
===========
CrayEnv gives you the original Cray environment as you get when you log in
to the compute nodes.

In the current implementation it will add the TCL modules to the MODULEPATH
rather than their LMOD equivalents as it is not clear yet how HPE-Cray
intends to use the latter.

The environment is not yet fully functional as it relies on a module restore
to load a particular PrgEnv and Lmod does not support the format used by
the TCL Environment Modules implementation to store those environments.
]==] )

prepend_path( 'MODULEPATH', '/opt/cray/pe/lmod/modulefiles/core' )
prepend_path( 'MODULEPATH', '/usr/share/modulefiles' )
prepend_path( 'MODULEPATH', '/usr/share/Modules/modulefiles' )
