$windowsApps = "$HOME\AppData\Local\Microsoft\WindowsApps"
$pythonDir = Get-ChildItem -Path $windowsApps -Directory -Filter "PythonSoftwareFoundation.Python.3.13_*" | Select-Object -First 1
if (-not $pythonDir) { Write-Error "No matching Python directory found"; exit 1 }
$pythonExe = Join-Path $pythonDir.FullName "python.exe"
$sitePackages = "$HOME\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.13_qbz5n2kfra8p0\LocalCache\local-packages\Python313\site-packages"
$env:PYTHONPATH = $sitePackages
& $pythonExe @args
