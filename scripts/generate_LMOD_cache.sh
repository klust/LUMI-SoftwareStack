#! /bin/bash
#
# Script to generate the LMOD cache.
#
# The script takes no arguments.
#
# The cache starts from the following directories:
#   - modules/StyleModifiers
#   - modules/Softwarestack
#
# TODO: As we sometimes re-initilize the Cray modules: can we avoid getting those
# in the cache? We may miss some due to the strange way in which MODULEPATH can be
# adapted.
#

# That cd will work if the script is called by specifying the path or is simply
# found on PATH. It will not expand symbolic links.
cd "$(dirname $0)"
cd ..
repo="${PWD##*/}"
cd ..
installroot="$(pwd)"

#
# The cache directory is $installroot/mgmt/LMOD/Cache
#
mkdir -p ${installroot}/mgmt/LMOD/Cache

$LMOD_DIR/update_lmod_system_cache_files \
    -d ${installroot}/mgmt/LMOD/Cache/cacheDir \
    -t ${installroot}/mgmt/LMOD/Cache/cacheTS \
    ${installroot}/modules/StyleModifiers:${installroot}/modules/SoftwareStack

TODO: Adapt lmod_Rc.lua, see https://lmod.readthedocs.io/en/latest/130_spider_cache.html
