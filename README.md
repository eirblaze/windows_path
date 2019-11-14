# windows_path.ps1.bat

![windows_path](https://raw.githubusercontent.com/eirblaze/windows_path/master/img/windows_path.png)

エクスプローラのフォルダやファイルを右クリックして現れる「送る」メニューから、環境変数「PATH」の追加ができるようになります。

## 動作

- フォルダに対して行うと、そのフォルダへのパスを追加します。
- ファイルに対して行うと、そのファイルが入れられた親ディレクトリへのパスを追加します。

## 最初に注意

* 追加されたパスは、通常通り、windowsにログオンしなおさないと反映されません。
* もとの環境変数にトラブルが生じないよう最大限配慮していますが、万一に備え、 **もとの環境変数のバックアップ** を強く推奨いたします。
* 使用は自己責任でお願いします。万一、もとの環境変数が破壊されるなどしても、当方は一切の責任を負いかねます。
* 環境変数PATHのバックアップについては、こちら。[Qiita > 環境変数Pathのバックアップ](https://qiita.com/yuann/items/db279f7158adcc7a76b6)

## 詳細はこちら

[Qiita - Windowsの環境変数「PATH」を通す機能を、コンテキストの「送る」メニューに追加する](https://qiita.com/firblaze/items/63dea6813c0e9af38a78)

## 導入手順

### 1. バッチファイル入手

このリポジトリにある、[`windows_path.ps1.bat`](https://raw.githubusercontent.com/eirblaze/windows_path/master/windows_path.bat)を、任意のフォルダにコピーしてください。

### 2. コンテキストメニュー追加

同梱の`sendoto_menu.lnk`をダウンロードして開く。<br>
<br>
または、以下の操作でフォルダを開く<br>
<br>
 2-1. `Windows`キー + `R`キー<br>
 2-2. ダイアログに入力:`shell:sendto`<br>
<br>
ここへ、上記で作成したバッチファイルのショートカットを作成します。<br>
ファイル名は、「このファイルにパスを通す」などがおすすめです。<br>
ショートカットのアイコンも、右クリックのプロパティからお好きなように設定できます。

### 3. 環境設定を開きます

1. `Windows`キー + `Pause`キー -> 設定の変更 -> 詳細設定 ->  環境変数
2. もともとのユーザー環境変数pahtに、`%path2%`を追加します。

<p>
path2がまだないときは、1のバッチファイルにて自動追加されます。path2に分けるいことで、環境変数の文字制限(注3-1.)に引っかかる危険性を回避したり、もとの環境変数`path`を保護したりできます。
</p>

(注3-1.) [＠IT > クラウド > Windows Server Insider > 環境変数のサイズやPATHの長さ制限に注意](https://www.atmarkit.co.jp/ait/articles/1510/30/news041.html)

### 4. 番外編。システム環境変数とする場合

以下のコマンドがある行で、一番右の'User'を、'Machine'に書き換えます。
```
[Environment]::SetEnvironmentVariable('Path2', $NewPath, 'Machine')
```

## 参考1: バッチファイル

- [Windows10 「送る」によく使うフォルダーを追加する方法(SendTo)](https://pc-chain.com/windows10-sendto/2736/)
- [Windows で環境変数 PATH をいじる方法のまとめ](https://qiita.com/sta/items/6d29da0dc7069ffaae60)
- [SETX コマンドで環境変数を永続的に設定する](https://qiita.com/rohinomiya/items/cf5236678b3459da9017)
- [Windowsバッチまとめ](https://qiita.com/tomotagwork/items/5b9e08f28d5925d96b5f#%E5%A4%89%E6%95%B0)
- [DOSバッチファイルを書くときに気をつけていること](https://qiita.com/yz2cm/items/d2c86a09d6b1861d684d)
- [Windows、バッチファイル（.bat）に引数を渡す](http://piyopiyocs.blog115.fc2.com/blog-entry-725.html)
- [＠IT > クラウド > Windows Server Insider > 環境変数のサイズやPATHの長さ制限に注意](https://www.atmarkit.co.jp/ait/articles/1510/30/news041.html)
- [Windows、バッチファイル（.bat）からフォルダを開く - マコトのおもちゃ箱](http://piyopiyocs.blog115.fc2.com/blog-entry-490.html)

## 参考2: PowerShell

- [Windows環境変数の設定に「SETX」コマンドを使ってはいけない理由](https://qiita.com/jeyei/items/05ce2739501832463b3b)
- [バッチファイルから PowerShell を呼び出す方法](https://qiita.com/cd01/items/82829ba0ec0f59e1b04d)
- [batからps1ファイルを実行するときのあれこれ](https://qiita.com/HiDARi/items/1d2595ff142883c3bac1)
- [PowerShellで環境変数を参照、設定する](https://www.whyit.work/entry/2018/07/09/171632)
- [Powershellで引数を受け取る](https://microsoftou.com/ps-arguments/)
- [MURA's HomePage > Windows にまつわる e.t.c. > PowerShell スクリプト引数(Param)の Tips](https://www.vwnet.jp/Windows/PowerShell/Param.htm)
- [Test-Pathコマンドレットで変数の有無を確認できる](https://m0t0k1x2.tumblr.com/post/133499335514/test-path%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E3%83%AC%E3%83%83%E3%83%88%E3%81%A7%E5%A4%89%E6%95%B0%E3%81%AE%E6%9C%89%E7%84%A1%E3%82%92%E7%A2%BA%E8%AA%8D%E3%81%A7%E3%81%8D%E3%82%8B)
- [バヤシタ ＞ PowerShell ＞ ファイル・フォルダ ＞ ファイルとフォルダのどちらかを判定する方法](https://bayashita.com/p/entry/show/229)
- [IT製品情報 IT Search+解説/事例記事（サーバ/ストレージ）【連載】PowerShell Core入門 - 基本コマンドの使い方 [6] ファイルやディレクトリの表示 Get-Item、Get-ChildItem、Format-List](https://news.mynavi.jp/itsearch/article/hardware/3718)
- [Windows 使ってますね♪ / PowerShell / PowerShellのif文でand,or,xor,notを記述する方法](https://win.just4fun.biz/?PowerShell/PowerShell%E3%81%AEif%E6%96%87%E3%81%A7and%2Cor%2Cxor%2Cnot%E3%82%92%E8%A8%98%E8%BF%B0%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95)
- [ExRecord > PowerShell > Windows PowerShellの文字列内で変数を扱う方法](http://exrecord.net/how-to-use-variable-in-string)
- [CodeZine > Windows PowerShell 入門 > Windows PowerShell 入門（10）－デバッグ編](https://codezine.jp/article/detail/3067)
- [ほそぼそプログラミング日記 » PowerShell » 【PowerShell】環境変数を設定する](https://hosopro.blogspot.com/2017/01/powershell-set-environment-variable.html)
