## アプリケーション名
「famous-castles」

## アプリケーションの概要
100名城を訪ね、行った時の写真や感想を投稿できる。

## URL
https://famous-castles.herokuapp.com/

## テスト用アカウント
email: panda@panda  
password: 1a1a1a

## 利用方法
新規会員登録し、訪ねたお城の投稿ができる。

## 目指した課題解決
自分が100名城を訪ねた時に駐車場から徒歩で天守までのどれくらいかかるか、滞在時間、駐車場有無などが気になったため。

## 洗い出した要件
機能|目的|詳細|ストーリー
-|-|-|-
トップページ|投稿内容を表示・各機能へアクセスできるように|・投稿写真から詳細ページに遷移できる<br>・みんなの投稿・ユーザー一覧ボタンがありそれぞれのページにアクセスできる|「100名城に行こう」の本を買った人が行こうと思った時にお城の情報を知りたい。
ユーザー管理機能|deviseを用いたユーザー管理機能|トップページ右上にログイン、新規登録ボタンを表示させる。ログイン時はログアウトボタンを表示させる。|
ユーザー一覧表示機能|たくさんのお城に行ってる人がいるか知るため|気になった人の投稿を見ることができる。|
ユーザー編集機能|ユーザー情報を編集できるようにする|email,password,profile,画像を編集できる|
投稿機能|訪ねたお城の投稿ができる|お城名、感想、画像を投稿できる|
複数画像投稿機能|たくさん写真を投稿したい場合に備えて|-|-
お城情報機能|100名城の情報が見える|1城ずつ城の情報やコメント、マップが見れる|
S3|heroku上で長期的に画像を表示させるため|AWSを利用|-
100名城マップ機能|トップページにグーグルマップを埋め込む|城を選びクリックするとルートを調べることができる
検索機能|お城情報を知るため|トップページの検索窓からキーワードを入力するとお城のコメント等が見れる|
絵文字対応機能|絵文字で入力した場合に対応する|||


## 実装した機能についてのGIFと説明
実装した機能について、それぞれどのような特徴があるのか列挙しましょう。GIFを添えることで、イメージがしやすくなります。

## 実装予定の機能
- 絵文字対応機能
- 100名城マップ機能
- s3

## ER図
![ER](https://user-images.githubusercontent.com/75361827/106983486-52219a80-67a9-11eb-99bc-a24778b9b9b5.png)

## データベース設計

### users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| profile            | text   |             |
| profile_image_id   | string |             |

### Association
- has_many :posts

### posts テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| body               | text   | null: false |
| image_id           | string | null: false |
| body               | string | null: false, foreign_key: true |

### Association
- belongs_to :user

## ローカルでの動作方法
```
$ git clone https://github.com/hardyhoshi/famous-castles.git
$ cd famous-castles
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails s

# http://localhost:3000 へアクセス
```
開発環境  
Rails : 6.0.3.4  
Ruby  : 2.6.5  
DB    : MySQL