# cotainr user documentation.

Extensive user documentation for cotainr is available on
[ReadTheDocs](https://cotainr.readthedocs.io/en/latest/).
There is also [some LUMI-specific information](https://docs.lumi-supercomputer.eu/software/containers/singularity/#building-containers-using-the-cotainr-tool) on the 
[Singularity page in the main LUMI documentation](https://docs.lumi-supercomputer.eu/software/containers/singularity).

The cotainr package is developed by the LUMI consortium member DeiC (Denmark).

Several modules are available on LUMI, depending on the environment that you're
using:

-   In `CrayEnv` the `cotainr` modules will use whatever version of `cray-python`
    is the default, which depends on other modules you may have loaded and can also
    change after system updates.
-   In `LUMI` software stacks the version of `cray-python` that matches the 
    version of the software stack will be used. This is also reflected in the 
    version part of the name of the module.
