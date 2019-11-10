@powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[scriptblock]::create((gc \"%~f0\"|?{$_.readcount -gt 1})-join\"`n\");&$s" ""%*""&goto:eof

# 引数
Param($Arg1)
Write-Host $Arg1

# ファイル存在チェック
Write-Host "ファイル存在チェック"
Test-Path $Arg1

# バヤシタ ＞ PowerShell ＞ ファイル・フォルダ ＞ 親フォルダの絶対パスを取得する方法 https://bayashita.com/p/entry/show/133
Write-Host "親フォルダの絶対パスを取得する"
$parent_folder = Split-Path $Arg1
Test-Path $parent_folder

# PSIsContainer でファイルかフォルダかを判定 https://bayashita.com/p/entry/show/229
Write-Host "ファイルかフォルダかを判定"
if($Arg1.PSIsContainer)
{
    # フォルダの場合の処理
    Write-Host 'フォルダです。'
}
else
{
    # ファイルの場合の処理
    Write-Host 'ファイルです。'
}

# 環境変数存在チェック
Test-Path Env:Path
Test-Path Env:Path2
Test-Path Env:Path3
Test-Path Env:Path4

# 環境変数取得 - $env:環境変数名
Write-Host "Path"
Write-Host $env:Path
Write-Host "Path2"
Write-Host $env:PATH2

# 環境変数をセット。新規／上書き
