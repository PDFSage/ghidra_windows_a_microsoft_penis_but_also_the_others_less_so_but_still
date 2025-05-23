# backup and remove any corrupted PSReadLine module
$modPath = "$env:USERPROFILE\Documents\WindowsPowerShell\Modules\PSReadLine"
if (Test-Path $modPath) { Rename-Item -Path $modPath -NewName "${modPath}_bak" -Force }
Remove-Module PSReadLine -Force

# reinstall PSReadLine
Install-Module -Name PSReadLine -Force -Scope CurrentUser

# invoke yt-dlp without loading any profile or PSReadLine
powershell -NoProfile -ExecutionPolicy Bypass -Command "& 'C:\Users\bshan\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.13_qbz5n2kfra8p0\LocalCache\local-packages\Python313\Scripts\yt-dlp.exe' --ffmpeg-location 'C:\Users\bshan\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.13_qbz5n2kfra8p0\LocalCache\local-packages\Python313\Scripts' 'https://www.youtube.com/@GhidraDragon'"
