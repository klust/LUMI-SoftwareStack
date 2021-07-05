#
# Hooks for LUMI.
#
# This version: Used from LUMI/21.04 and EasyBuild 4.4.0 onwards
#
# Authors:
#   Kurt Lust, University of Antwerp and LUMI User Support Team
#

import os

def parse_hook(ec, *args, **kwargs):
    """LUMI parse hooks
         - cpeCray, cpeGNU, cpeAMD, cpeIntel, cpeNVIDIA: Add correct cray_targets list.
    """

    if ec.name == 'cpeCray' or ec.name == 'cpeGNU' or ec.name == 'cpeAMD' or ec.name == 'cpeIntel' or ec.name == 'cpeNVIDIA':
        # Fill in cray_targets if it is left empty.
        if ec['cray_targets'] == []:
            lumi_partition = os.environ['LUMI_STACK_PARTITION']
            if lumi_partition == 'common' or lumi_partition == 'L':
                ec['cray_targets'].extend( [
                    'craype-x86-rome',
                    'craype-accel-host',
                    'craype-network-ofi'
                ] )
            elif lumi_partition == 'C':
                ec['cray_targets'].extend( [
                    'craype-x86-milan',
                    'craype-accel-host',
                    'craype-network-ofi'
                ] )
            elif lumi_partition == 'G':
                ec['cray_targets'].extend( [
                    'craype-x86-milan',
                    'craype-accel-amd-gfx908',
                    'craype-network-ofi'
                ] )
            elif lumi_partition == 'D':
                ec['cray_targets'].extend( [
                    'craype-x86-rome',
                    'craype-accel-nvidia80',
                    'craype-network-ofi'
                ] )

        #
        # END of processing cpeCray/cpeGNU/cpeAMD/cpeIntel/cpeNIVIDIA
        #


    #
    # END of parse_hook
    #