### とりあえず表示できたやつ
<img src="/img/electron_app.png" width="100%">

### 使ったもの
https://www.electronjs.org/docs/tutorial/first-app
上記を頼りに動作させることができた

### 環境
ver
Microsoft Windows [Version 10.0.19041.388]

### はまりどころ
#### npm がないと言われる
<img src="/img/npm_not_found.png" width="100%">
チェックボックスをONにしたらnpm -vで確認できるようになった
あと、powershellを再起動した

#### electronという名前のアプリケーションの中にelectronはnpm installできないと言われる
<img src="/img/electron_already_installed.png" width="100%">
エラーメッセージから判明した。directory nameをelectronにして、npm initしたらpackage.jsonのアプリ名がelectornになっていて、electornをnpm installしようとしたらできないと言われた。なのでpackage.jsonのnameをelectron以外にしたら大丈夫だった
