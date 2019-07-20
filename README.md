# windows_path

ユーザ環境変数のpathを設定。コンテキストの送るメニューに、「このファイルへパスを通す」を追加する。

## 最初に注意

* 追加されたパスは、通常通り、windowsにログオンしなおさないと反映されません。
* もとの環境変数にトラブルが生じないよう最大限配慮していますが、万一に備え、 **もとの環境変数のバックアップ** を強く推奨いたします。
* 使用は自己責任でお願いします。万一、もとの環境変数が破壊されるなどしても、当方は一切の責任を負いかねます。

## 詳細はこちら

[Qiita - Windowsの環境変数「PATH」を通す機能を、コンテキストの「送る」メニューに追加する](https://qiita.com/firblaze/items/63dea6813c0e9af38a78)

## 導入手順

### 1. バッチファイル入手

このリポジトリにある、[`windows_path.bat`](https://raw.githubusercontent.com/eirblaze/windows_path/master/windows_path.bat)を、任意のフォルダにコピーしてください。

### 2. コンテキストメニュー追加

以下の操作でフォルダを開く<br>
<br>
 2-1. `Ctrl+R`<br>
 2-2. ダイアログに入力:`shell:sendto`<br>
<br>
ここへ、上記で作成したバッチファイルのショートカットを作成します。<br>
ファイル名は、「このファイルにパスを通す」などがおすすめです。<br>
ショートカットのアイコンも、右クリックのプロパティからお好きなように設定できます。

### 3. 環境設定を開きます

<p>
マイコンピュータを右クリック -> プロパティ -> 設定の変更 -> 詳細設定 ->  環境変数
</p>

1. ユーザー側に、新たな環境変数`path2`を作ります。
2. もともとのユーザー環境変数pahtに、`%path2%`を追加します。
3. `path2`に、`path`の最後の１つを移動し、最初の変数とします。これをやらないと`;`が先頭に追加され、正常に動作しません。(7/20追記)

<p>
例：もともと<br>
<br>
path  = `C:\aaaa\bin;D:\iiii\bin`<br>
path2 = `(なし)`<br>
<br>
だったものが、変更後、<br>
<br>
`path`  = `C:\aaaa\bin;%path2%`<br>
`path2` = `D:\iiii\bin`<br>
<br>
になっている必要があります。<br>
</p>
<p>
これらをやらないと、`setx`コマンドの1024文字制限(注3-1.)に引っかかる可能性があるのと、もとの環境変数`path`を保護する意味合いがあります。
</p>
<p>
(注3-1.) [＠IT > クラウド > Windows Server Insider > 環境変数のサイズやPATHの長さ制限に注意](https://www.atmarkit.co.jp/ait/articles/1510/30/news041.html)
</p>

### 4. 番外編。システム環境変数とする場合

バッチファイルのsetxへ、以下のように`/M`を書き加えます。

## 参考1: バッチファイル

- [Windows10 「送る」によく使うフォルダーを追加する方法(SendTo)](https://pc-chain.com/windows10-sendto/2736/)
- [Windows で環境変数 PATH をいじる方法のまとめ](https://qiita.com/sta/items/6d29da0dc7069ffaae60)
- [SETX コマンドで環境変数を永続的に設定する](https://qiita.com/rohinomiya/items/cf5236678b3459da9017)
- [Windowsバッチまとめ](https://qiita.com/tomotagwork/items/5b9e08f28d5925d96b5f#%E5%A4%89%E6%95%B0)
- [DOSバッチファイルを書くときに気をつけていること](https://qiita.com/yz2cm/items/d2c86a09d6b1861d684d)
- [Windows、バッチファイル（.bat）に引数を渡す](http://piyopiyocs.blog115.fc2.com/blog-entry-725.html)

## 参考2: PowerShell

今回は適用してないがPowershell版の参考
- [バッチファイルから PowerShell を呼び出す方法](https://qiita.com/cd01/items/82829ba0ec0f59e1b04d)
- [batからps1ファイルを実行するときのあれこれ](https://qiita.com/HiDARi/items/1d2595ff142883c3bac1)
- [PowerShellで環境変数を参照、設定する](https://www.whyit.work/entry/2018/07/09/171632)
- [Powershellで引数を受け取る](https://microsoftou.com/ps-arguments/)
