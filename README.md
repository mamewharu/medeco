# README

# アプリケーション名
- medeco

# 概要
- 部署ごとのコミュニケーションツール

# URL

# テスト用アカウント
## ユーザー認証
- username:maguro
- password:2741

# テスト用アカウント
## test1
- email: test@test.jp
- password: 11111a

## test2
- email: hoge@hoge.jp
- password: 22222b


# 利用方法
## 新規登録
- sign_upをクリックし新規登録を行います。
- 名前、email、password、所属番号、所属を入力し、アカウントを作成します。
## チャットを選ぶまたは作成する。
- チャットを作成するをクリックします。
- 部署名のプルダウンにルームがある場合はそちらを選択してください。ない場合は作成できます。
- 連絡を取りたい部署先を選んでください。
- トップページへ左側のサイドバーにルーム名があれば成功です。
## コメントを投稿する
- 投稿したい部署先のページへ行きます。
- 下のフォーム欄にコメントを入力します。
- 送信ボタンを押すとメッセージ一覧に表示され投稿完了です。
## 画像を投稿する
- 下のフォームの画像をクリックします。
- 画像を選択し、送信ボタンを押します。
- メッセージ一覧に表示されれば完了です。
## 退出する
- 右上の赤地で退出するをクリックするとトップページへ戻ります。
## ログアウトする
- 右上の赤地でログアウトをクリックするとログアウトでき、sign_inページへ戻ります。
## 注意事項
- 一度作成したルームは削除できません。
- 一度送信したメッセージ、画像は削除できません。

# 目指した課題解決
病院内部で部署間で連絡を取り合う方々向けて作成しようと思いました。
きっかけとしましては、他部署の要望に対してどの要望をやったのかの記録が残らないので
同じことを繰り返すといったコミュニケーションのヒューマンエラーを解決したいという課題を見つけたからです。


# 洗い出した要件
## medecoの要件定義

### ユーザー管理機能
### 要件
- emailとパスワードでログインする
- ユーザー新規登録ができる
- ユーザーは名前、email、password、所属番号、所属がないと登録できない
- ユーザーは名前とemailを変えることができる
- ログアウトできる

### ルーム作成機能
### 要件
- ルーム新規作成ボタンがある
- ログインしているユーザーをクリックするとユーザー詳細へ遷移する
- ログアウトボタンがある


### メッセージ投稿機能
### 要件
- 指定したルーム(病棟)とのみチャットができる
- ルームは削除できない
- メッセージの削除はできない
- 画像の投稿ができる
- トップページへ遷移するボタンがある

# 開発環境
## バックエンド
- Ruby on Rails 6.0
## フロント
- HTML, CSS
## データベース
- MySQL
## ソース管理
- Git Hub
## テスト
- RSpec
## エディタ
VSCode

# 実装予定の内容
- 相手側が左側、使用している側が右がwになるような実装

# DB設計
## ER図
[medeco](https://user-images.githubusercontent.com/77311098/109117309-2a5c9b80-7785-11eb-9d40-8bfc8ff7e16f.png)

## userテーブル
| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| name       | string     | null: false |
| email      | string     | null: false |
| password   | string     | null: false |
| staff_num  | integer    | null: false |
| occupation | string     | null: false |

### Association
- has_many :rooms, through: :room_users
- has_many :messages
- has_many :room_users

## roomテーブル
| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| name     | string     | null: false |

### Association
- has_many   :users, through: :room_users
- has_many   :users
- has_many :messages

## user_roomテーブル
| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| user     | references | foreign_key: true |
| room     | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :room

## messageテーブル
| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| text     | string     |                   |
| user     | references | foreign_key: true |
| room     | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :room
