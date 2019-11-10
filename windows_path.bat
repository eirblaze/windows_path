@powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[scriptblock]::create((gc \"%~f0\"|?{$_.readcount -gt 1})-join\"`n\");&$s" ""%*""&goto:eof

# 引数
Param($Arg1)
Write-Debug $Arg1

# ファイル存在チェック
Write-Debug "ファイル存在チェック"

if( -Not(Test-Path $Arg1) ){
    Write-Debug '指定されたファイルは存在しません。処理を終了します。'
    exit
}

# アイテムを取得
$item = Get-Item $Arg1

# PSIsContainer でファイルかフォルダかを判定 https://bayashita.com/p/entry/show/229
Write-Debug "ファイルかフォルダかを判定"
if($item.PSIsContainer)
{
    # フォルダの場合の処理
    Write-Debug "$($item.Name)はフォルダです。"
}
else
{
    # ファイルの場合は・・・
    Write-Debug "$($item.Name)はファイルです。"

    # 親フォルダをアイテムとして再取得
    # バヤシタ ＞ PowerShell ＞ ファイル・フォルダ ＞ 親フォルダの絶対パスを取得する方法 https://bayashita.com/p/entry/show/133
    $parent_folder = Split-Path $Arg1

    # アイテムを再取得
    $item = Get-Item $parent_folder

    if ($item.PSIsContainer) {
        Write-Debug "アイテムを$($item.Name)として再取得成功"
    }
}
Write-Debug "フルネーム $($item.FullName)"

# 新しい環境変数を生成。新規／上書きで処理を分岐。

# 新規の場合
if ( -Not(Test-Path Env:Path2) ) {
    # 新しい文字列を生成
    Write-Debug "new Path2"
    $NewPath = $item.FullName
}
# 追加の場合
else
{
    # 新しい文字列を生成
    Write-Debug "add Path2"
    $NewPath = "$($env:Path2);$($item.FullName)"
}

# 環境変数をセット
Write-Debug "セット予定 $($NewPath)"
[Environment]::SetEnvironmentVariable('Path2', $NewPath, 'User')

Write-Debug "現在のenv:Path2 $($env:Path2)"

Write-Debug "---------------------------------------------------------------------------------------"
