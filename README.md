# shell scripts
筆者の怠惰によって生まれたコマンド集

## usage
### "do" series
コンパイルと実行を同時に行うスクリプト
- [make_do.sh](https://github.com/KoiShin/shell_scripts/blob/master/make_do.sh)
    - C言語、C++に対応
    - `-c` オプションをつけるとコンパイルのみ行う(それなら`make`コマンドでいいではないかと思うかもしれないが、ところがどっこい、`make`コマンドには補完がきかないのだ!!)
- [java_do.sh](https://github.com/KoiShin/shell_scripts/blob/master/java_do.sh)
    - JAVAに対応
- [tex_do.sh](https://github.com/KoiShin/shell_scripts/blob/master/tex_do.sh)
    - LaTeXに対応
    - LaTeX -> DVI -> PDF、そしてプレビューで開くところまで行う
    - `--clean`オプションをつけると中間ファイル(aux, dvi, log)を削除する
    - `--severe`オプションをつけるとWarningがあったらコンパイルをやめる

### other
- [create_tex_env.sh](https://github.com/KoiShin/shell_scripts/blob/master/create_tex_template/create_tex_env.sh)
    - LaTeXで書くレポートのひながたを作る
- [open_brackets.sh](https://github.com/KoiShin/shell_scripts/blob/master/open_brackets.sh)
    - Adobeのエディタ、Bracketsでファイルを開く
    - 引数にとったファイルが存在していない場合は、本家の`Brackets`コマンドとは違いファイルを作成した後に開くという仕様にした
