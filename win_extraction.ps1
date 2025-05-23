# windows_extraction.ps1
$snap = (Get-WmiObject -List Win32_ShadowCopy).Create("C:\","ClientAccessible")
$shadowDevice = "\\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy$($snap.ShadowID)"
Copy-Item "$shadowDevice\Windows\System32\drivers\rootkit.sys" -Destination "C:\Exports\rootkit.sys"
Copy-Item "$shadowDevice\Windows\System32\drivers\rootkit.pdb" -Destination "C:\Exports\rootkit.pdb"
(Get-WmiObject Win32_ShadowCopy | Where-Object { $_.ID -eq $snap.ShadowID }).Delete()
