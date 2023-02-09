-- A module to make the /appl/lumi/quantum modules available on LUMI, but 
-- without making them findable for the module spider command if the module
-- is not loaded to avoid interfering with the LUST software stack.

whatis( 'Description: Makes the local software collection managed by the quantum computing team of CSC available' )

help( [[
Description
===========
This module makes a software collection available managed and supported by the
quantum computing team of CSC for users experimenting on Helmi.

There is no guarantee that this software works together with software provided
by the CrayEnv, LUMI or spack software stacks on LUMI, though those modules will
not be automatically unloaded. Try at your own risk.

The LUMI User Support Team (LUST) is not managing the software made available by
this module, nor can LUST make any changes or corrections. Support for these
packages is provided by the CSC service desk, see https://docs.csc.fi/support/contact/.

The software provided by this module is not discoverable with module spider
unless the module is loaded.


More information
================
 - Web pages: https://docs.csc.fi/computing/quantum-computing/helmi/running-on-helmi/
 - Site contact: Help for the software made available by this module is provided
   by the CSC service desk (https://docs.csc.fi/support/contact/) and not by
   the LUMI User Support Team
   
]] )



--
-- Only make the MODLEPATH change visible to LMOD when loading, unloading or 
-- showing a module to avoid interfereing with, e.g., module spider.
--

if mode() == 'load' or mode() == 'unload' or mode() == 'show' then
    prepend_path( 'MODULEPATH', '/appl/local/quantum/modulefiles' )
end

--
-- Print a message.
--

if mode() == 'load' then
    LmodMessage( 'This software collection is provided and supported by Quantum Computing team of CSC.\n' ..
                 'Run `module help CSC` for more information about support.' )
end
