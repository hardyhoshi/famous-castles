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
トップページ|投稿内容を表示・各機能へアクセスできるように|【ボタン】<br>・サインイン／ログインページへ遷移できるボタンがある<br>・ログイン時は、ログアウトボタンがある<br>・投稿写真から詳細ページに遷移できる<br>・みんなの投稿・ユーザー一覧ボタンがありそれぞれのページにアクセスできる|「100名城に行こう」の本を買った人が行こうと思った時にお城の情報を知りたい。


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