#!/bin/bash


####################:- Meta Data Information -:##########################
# Author: Vishal Kumar
# Date: 04/07/2024
#
# Output: Node health
# Version: V1
#########################################################################


# set -x # debug mode

# Print the disk space
echo "Total disk space: "
df -h

# Print the free space
echo "Total free space of the VM:"
free -g

# Print the resources
echo "Total resources:"
nproc

