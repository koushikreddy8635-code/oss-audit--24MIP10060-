#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: GODALA KOUSHIK REDDY (24MIP10060)
# Software: Linux Kernel

# List of important system directories to audit
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "=========================================="
echo "        Directory Audit Report"
echo "=========================================="

# Loop through each directory in the list
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Extract permissions, owner, and group
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        
        # Calculate size of the directory
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        
        echo "DIR: $DIR"
        echo " -> Permissions/Owner: $PERMS"
        echo " -> Current Size     : $SIZE"
        echo "------------------------------------------"
    else
        echo "Warning: $DIR does not exist on this system."
    fi
done

# TODO: Audit the kernel configuration directory if it exists
KDIR="/usr/src/kernels"
if [ -d "$KDIR" ]; then
    echo "Kernel Source Directory Found: $KDIR"
    ls -ld "$KDIR" | awk '{print "Permissions: " $1 " | Owner: " $3}'
fi
echo "=========================================="
