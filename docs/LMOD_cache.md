# Experiments with the LMOD cache

-   Problem 1: When generating the cache, make sure LMOD cannot find any module that should not be
    be in the cache:

    -   Spack modules, as in the central stack we have no control over updates of the Spack stack
    -   CSC modules and other modules in /appl/local
    -   User-installed software
  
-   Problem 2: Need absolute paths in the lmodrc.lua file with properties, so we cannot do this in
    the fully git-managed file as we need different versions, or need to modify the way that file
    is managed, or created from separate git-managed files.

Experiment in `init-lumi-h`:

-   May have made some mistakes with removing the user directories, as so far we got them in
    the cache.

-   Added to the `lmodrc.lua` file of the software stack:

    ``` lua
    scDescriptT = {
        {
        ["dir"]       = "/users/kurtlust/LUMI/modules/cacheDir",
        ["timestamp"] = "/users/kurtlust/LUMI/modules/cacheTS.txt",
        },
    }
    ```

-   To create the cache:

    ``` bash
    /opt/cray/pe/lmod/lmod/libexec/update_lmod_system_cache_files -d /users/kurtlust/LUMI/modules/cacheDir -t /users/kurtlust/LUMI/modules/cacheTS.txt /users/kurtlust/LUMI/modulefiles
    ```


