@powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[scriptblock]::create((gc \"%~f0\"|?{$_.readcount -gt 1})-join\"`n\");&$s" ""%*""&goto:eof

Param($Arg1)

Write-Host $Arg1

Test-Path Env:Path
Test-Path Env:Path2
Test-Path Env:Path3
Test-Path Env:Path4
