#!/bin/bash

# Ensure Azure CLI is logged in
az account show > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Please log in to Azure CLI first."
    exit 1
fi

# 1. List of VMs on account
echo "List of VMs on account:"
az vm list --output table
az vm list --output table >> azure_info

# 2. List of active VMs on account
echo ""
echo "List of active VMs on account:"
az vm list --show-details --query "[?powerState=='VM running']" --output table
az vm list --show-details --query "[?powerState=='VM running']" --output table >> azure_info

# 3. Summary of the cost for the current billing. 
echo ""
echo "Summary of the cost for the current billing."
az consumption usage list --query "[?properties.meterCategory=='Virtual Machines']" --output table
az consumption usage list --query "[?properties.meterCategory=='Virtual Machines']" --output table >> azure_info

# 4. List of services in use
echo ""
echo "List of services in use:"
az resource list --output table
az resource list --output table >> azure_info

# Specific types of resources in use.
echo "Tpoe of resource in use:"
az resource list --query "[?type=='Microsoft.Compute/virtualMachines']" --output table
az resource list --query "[?type=='Microsoft.Compute/virtualMachines']" --output table >> azure_info

