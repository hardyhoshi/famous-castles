## アプリケーション名
famous-castles

## アプリケーションの概要
100名城を訪ね、行った時の写真や感想を投稿できる。

## URL
デプロイ後に記述予定

## テスト用アカウント
email: panda@panda
password: 1a1a1a

## 利用方法
新規会員登録し、訪ねたお城の投稿ができる。

## 目指した課題解決
自分が100名城を訪ねた時に駐車場から徒歩で天守までのどれくらいかかるか、滞在時間、駐車場有無などが気になったため。

## 洗い出した要件
スプレッドシートにまとめた要件定義を、マークダウンで記述しなおしましょう。

## 実装した機能についてのGIFと説明
実装した機能について、それぞれどのような特徴があるのか列挙しましょう。GIFを添えることで、イメージがしやすくなります。

## 実装予定の機能
洗い出した要件の中から、今後実装予定のものがあれば記述しましょう。

## データベース設計

### users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |

### Association
- has_many :posts

### posts テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| body               | text   | null: false |

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
動作確認：(ruby 2.6.5, rails 6.0.0) 