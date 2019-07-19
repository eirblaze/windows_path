@powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[scriptblock]::create((gc \"%~f0\"|?{$_.readcount -gt 1})-join\"`n\");&$s" %*&goto:eof

$env:Path += ";C:\Program Files\OpenSSH"
[Environment]::SetEnvironmentVariable('PATH', $Env:Path, 'Machine')
pause
