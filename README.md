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


## 実装した機能についてのGIFと説明
### ユーザー登録機能
![c451c9063ff624ccc95c31113b236d4f](https://user-images.githubusercontent.com/75361827/107221821-7d311600-6a57-11eb-9c75-5ca84ceda663.gif)
### ユーザー編集機能
![487c6e429ec495aa0ff11d53fc984902](https://user-images.githubusercontent.com/75361827/107221982-b23d6880-6a57-11eb-8ef5-98dc8c1c7eed.gif)
### ユーザー一覧・詳細機能
![cd1521d8521bea52c0940556f6de3063](https://user-images.githubusercontent.com/75361827/107222200-f892c780-6a57-11eb-92bc-d0e72653d2de.gif)
### 投稿機能
![64bb2f6a4974151b858fa2feb0d0b494](https://user-images.githubusercontent.com/75361827/107222070-cd0fdd00-6a57-11eb-92f8-013635a6e868.gif)
### 投稿一覧表示・編集機能
![6cc07c760468a3983805aeceef4da632](https://user-images.githubusercontent.com/75361827/107222324-1d873a80-6a58-11eb-8d6e-3ba9993f5e63.gif)
### 100名城マップ機能
![map](https://user-images.githubusercontent.com/75361827/107222900-d5b4e300-6a58-11eb-869d-d2cd40e383d2.gif)

## 実装予定の機能
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