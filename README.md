# README

# アプリケーション名
- medeco

# 概要
- 部署ごとのコミュニケーションツール

# URL

# テスト用アカウント

# 利用方法

# 目指した課題解決
病院内部で部署間で連絡を取り合う方々向けて作成しようと思いました。
きっかけとしましては、他部署の要望に対して誰がどの要望をやったのかの記録が残らないので
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


### メッセージ投稿機能
### 要件
- 指定したルーム(病棟)とのみチャットができる
- 相手が左側、ユーザー本人が右側に配置している
- ルームは削除できない
- メッセージの削除はできない
- 画像の投稿ができる
- トップページへ遷移するボタンがある

# DEMO

# 実装予定の内容
- メッセージ投稿機能

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
- has_many :users
- has_many :rooms
