$windowsApps = "$HOME\AppData\Local\Microsoft\WindowsApps"
$pythonDir = Get-ChildItem -Path $windowsApps -Directory -Filter "PythonSoftwareFoundation.Python.3.13_*" | Select-Object -First 1
if (-not $pythonDir) { Write-Error "No matching Python directory found"; exit 1 }
$pythonExe = Join-Path $pythonDir.FullName "python.exe"

$prefix = "$HOME\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.13_qbz5n2kfra8p0\LocalCache\local-packages\Python313"
$sitePackages = Join-Path $prefix "site-packages"
$scriptsDir = Join-Path $prefix "Scripts"
$env:PYTHONPATH = $sitePackages

if ($args.Count -ge 2 -and $args[0] -eq '-m') {
    $module = $args[1]
    $exePath = Join-Path $scriptsDir "$module.exe"
    if (Test-Path $exePath) {
        if ($args.Count -gt 2) {
            $remainingArgs = $args[2..($args.Count - 1)] -join ' '
            & $exePath $remainingArgs
        } else {
            & $exePath
        }
        exit $LASTEXITCODE
    }
}

& $pythonExe @args
