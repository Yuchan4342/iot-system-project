# 概要 About this repository
2018年春学期授業「IoTシステム設計」の制作システム  
This is a project in class, IoT System Design on Spring Semester in 2018.

# 役割 Part
- ソフト Software: 岩田 Yuto Iwata  
- ハード Hardware: 佐藤 Masashi Sato

# 仕様 Specification
LEDが光ったら対応するキーボードをなるべく早く押すゲーム。
早く押すほど得点が高い。
高い得点を目指す。
GPIOをブレッドボードにつないで、LEDをつなげる。(できればコンデンサを用いてゆっくり光らせるようにする)
パターンをスイッチで切り替える(時間があれば)

* LED: 次の2つの目的で使う。
  - 光る用
  - キーボード押したときに光る用

* 7セグLED:  
  - 得点を出力(できれば)

## ソフト Software
使用言語 Language: C言語  
キーボードの入力を0, 1に変換してパターンのメモリに送り込む。  
キーボードからの入力を受ける while 文は毎回 1ms スリープさせる。  
回路から与えられたメモリから得点を取得して記録する。  
ゲームのLEDパターンを送信する。(ハードでもできると思うが、ソフトで行ったほうが柔軟)  
LED点灯パターンは次の18ビットで構成される。
- 上10ビット: 点灯する時刻(100ms単位のタイムスタンプ)
- 下8ビット: 点灯するLEDの位置

もしかしたら、FPGA側からフィードバックを受け取る処理が必要かも。  

## ハード Hardware
ソフト側の入力(ユーザの入力パターン、ゲームのパターン)を受け取り、GPIOに出力。
また、タイミングに応じて得点を計算し、GPIO or HPCに出力。

# スケジュール Schedule
## 第11回(06/28),第12回(07/05)
ソフト: 実装・単体テスト  
ハード: 実装・単体テスト

## 第13回(07/12)
統合テスト, 修正・改良  

# ビルドの仕方 How to build
@ root ディレクトリ(iot-system-project)  
```
$ make
```
`src/main` をボード上のLinuxカーネル(`/home/root`など)にコピー
