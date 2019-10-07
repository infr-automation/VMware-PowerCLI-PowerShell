New-DrsClusterGroup -Name All-iSCSI-VMs -Cluster vSAN-Cluster -VM (Get-VM -Location (Get-Cluster vSAN-Cluster) | where{(Get-VM -Datastore *iSCSI*) -contains $_})
