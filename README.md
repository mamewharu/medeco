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
- ユーザーIDとパスワードでログインする
- ユーザー新規登録ができる
- ユーザーがパスワードのみ変えることができる
- ログアウトできる

### ルーム作成機能
### 要件
- ルーム新規作成ボタンがある
- ログインしているユーザーをクリックするとユーザー詳細へとぶ


### メッセージ投稿機能
### 要件
- 指定したルーム(病棟)とのみチャットができる
- 相手が左側、ユーザー本人が右側に配置している
- ルームは削除できない
- メッセージは編集ができる
- メッセージの削除はできない
- 相手のメッセージをクリックしたら背景が変わる
- 画像の投稿ができる
- トップページへ戻るボタンがある

# DEMO

# 実装予定の内容
- ユーザー管理機能

# DB設計
## ER図
[medeco](https://user-images.githubusercontent.com/77311098/109117309-2a5c9b80-7785-11eb-9d40-8bfc8ff7e16f.png)

## userテーブル
| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| name       | string     | null: false |
| password   | string     | null: false |
| ID         | integer    | null: false |
| occupation | text       | null: false |

### Association
- has_many :rooms, through: :user_rooms
- has_many :messages
- has_many :user_rooms

## roomテーブル
| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| name     | string     | null: false |

### Association
- has_many   :user_room, through: :user_rooms
- has_many   :users

## user_roomテーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| room     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :room

## messageテーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| text     | string     | null: false                    |
| user     | references | null: false, foreign_key: true |
| room     | references | null: false, foreign_key: true |

### Association
- has_many :users
- has_many :rooms
