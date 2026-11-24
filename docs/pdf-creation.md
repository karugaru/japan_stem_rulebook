# PDF作成手順書

Markdownで書いた日本語の文章と数式を、PandocとMiKTeXを使ってA5サイズのPDFに変換します。

## 必要な環境

- Windows
- [Pandoc](https://pandoc.org/)
- [MiKTeX](https://miktex.org/)
- インターネット接続（MiKTeXが不足するパッケージを取得するため）

Windows Package Manager（winget）を使う場合は、PowerShellで以下を実行します。

```powershell
winget install --id JohnMacFarlane.Pandoc --exact --source winget --scope user
winget install --id MiKTeX.MiKTeX --exact --source winget --scope user
```

インストール後、コマンドが見つからない場合はVS Codeやターミナルを再起動してください。初回のPDF生成時は、MiKTeXが必要なパッケージを自動的にダウンロードするため時間がかかります。

## PDFを生成する

リポジトリのルートで以下を実行します。

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\build-pdf.ps1
```

スクリプトが`output`フォルダを作成し、分割された原稿を指定順に結合して`output/booklet.pdf`を生成します。出力フォルダはGitには追加されません。`-ExecutionPolicy Bypass`は、この実行時のみPowerShellのスクリプト実行ポリシーを緩和します。

## 原稿と設定

[pdf/00-front-matter.md](../pdf/00-front-matter.md)に表紙と目次、各章のファイルに本文、[pdf/07-back-matter.md](../pdf/07-back-matter.md)に索引、あとがき、奥付をUTF-8で記述します。各章では`#`が章、`##`が節になり、章番号が自動で作成されます。文中の数式は`$S = \pi r^2$`、独立した数式は`$$`で囲みます。

目次は手書きで、現在はページ番号を付けていません。章や節を変更したときは目次も更新してください。

原稿の入力順、用紙サイズ、余白などは[pdf/booklet.yaml](../pdf/booklet.yaml)で変更できます。
出力先は[scripts/build-pdf.ps1](../scripts/build-pdf.ps1)で設定しています。

## 小冊子として印刷する

生成されるPDFは、A5のページが通常の順番で並んだものです。A4用紙を折って冊子にする場合は、PDFビューアーやプリンターの「小冊子印刷」機能を使って面付けし、プリンターの案内に従って両面印刷してください。単に「1枚に2ページ」を選ぶだけでは冊子順になりません。
