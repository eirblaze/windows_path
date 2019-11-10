@powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[scriptblock]::create((gc \"%~f0\"|?{$_.readcount -gt 1})-join\"`n\");&$s" ""%*""&goto:eof

# 引数
Param($Arg1)
Write-Host $Arg1

# ファイル存在チェック
Write-Host "ファイル存在チェック"

if( -Not(Test-Path $Arg1) ){
    Write-Host '指定されたファイルは存在しません。処理を終了します。'
    exit
}

# アイテムを取得
$item = Get-Item $Arg1

# PSIsContainer でファイルかフォルダかを判定 https://bayashita.com/p/entry/show/229
Write-Host "ファイルかフォルダかを判定"
if($item.PSIsContainer)
{
    # フォルダの場合の処理
    Write-Host "$($item.Name)はフォルダです。"
}
else
{
    # ファイルの場合は・・・
    Write-Host "$($item.Name)はファイルです。"

    # 親フォルダをアイテムとして再取得
    # バヤシタ ＞ PowerShell ＞ ファイル・フォルダ ＞ 親フォルダの絶対パスを取得する方法 https://bayashita.com/p/entry/show/133
    $parent_folder = Split-Path $Arg1

    # アイテムを再取得
    $item = Get-Item $parent_folder

    if ($item.PSIsContainer) {
        Write-Host "アイテムを$($item.Name)として再取得成功"
    }
}
Write-Host "フルネーム $($item.FullName)"

# 環境変数存在チェック/取得 - $env:環境変数名
Write-Host "環境変数存在チェック/取得"
if (Test-Path Env:Path) {
    Write-Host "Path"
    Write-Host $env:Path
}
if (Test-Path Env:Path2) {
    Write-Host "Path2"
    Write-Host $env:Path2
}
if (Test-Path Env:Path3) {
    Write-Host "Path3"
    Write-Host $env:Path3
}
if (Test-Path Env:Path4) {
    Write-Host "Path4"
    Write-Host $env:Path4
}

# 新しい環境変数を生成。新規／上書きで処理を分岐。

# 新規の場合
if ( -Not(Test-Path Env:PathN) ) {
    # 新しい文字列を生成
    Write-Host "new PathN"
    $NewPath = $item.FullName
}
# 追加の場合
else
{
    # 新しい文字列を生成
    Write-Host "add PathN"
    $NewPath = "$($env:PathN);$($item.FullName)"
}

# 環境変数をセット
Write-Host "セット予定 $($NewPath)"
[Environment]::SetEnvironmentVariable('PATHN', $NewPath, 'User')


Write-Host "現在のenv:PathN $($env:PathN)"

Write-Host "---------------------------------------------------------------------------------------"
