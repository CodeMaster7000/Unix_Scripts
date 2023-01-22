#!/bin/bash
if [ -z "$1" ]; then
    LABEL="bootable"
else
    LABEL=$1
fi
echo "Creating ISO..."
mkisofs -o disk.iso -b isolinux.bin -c boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -J -R -V $LABEL iso_root
