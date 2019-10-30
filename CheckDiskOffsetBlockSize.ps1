$objects = @();

@('localhost') | %{
    try{
        $srvName = $_
        Get-WmiObject -Class Win32_DiskPartition -ComputerName $srvName | %{
            $objects += [PSCustomObject]@{
                ServerName = $srvName
                DiskName = $_.Name
                StartOffset = $_.StartingOffset
                BlockSize = $.BlockSize
                Result = if(($_.StartingOffset % 4096) -eq 0){"Partitioned Correctly"}else{"ISSUE"}
            }
        }
    }
    catch{
        $_ | fl -Force
    }
}
$objects | Out-GridView
