# カネんだ
### 積み立て投資管理アプリです

[![Image from Gyazo](https://i.gyazo.com/50e90134741d397aaa513afccb5d8d9c.png)](https://gyazo.com/50e90134741d397aaa513afccb5d8d9c)

## URL
http://18.183.0.80/

### Basic認証
ユーザー名: kamahiro

パスワード: 0413

### テスト用アカウント
メールアドレス: abc@kanenda.com

パスワード: 123456

## アプリケーションの概要
積立投資の管理を目的としたアプリです。
自由にグループを作成することができ、個人用、家族用、子供の教育資金といった具合に、ユーザーの生活スタイルに合わせて資産を分けて管理することが可能です。

## 要件定義

### ペルソナ
・将来に不安があり、資産運用を始めてみた投資初心者

### 課題
・一般的な家計簿アプリでは、生活費と一緒になるため管理しにくい

・家族等複数で管理ができない

・自分の思うように資産が分類されてない（例.ビットコインが預金と一緒の扱い）

### 解決
・任意グループを作成し、共同で資産管理ができるようにする

・投資情報を投稿する際、分類を自由に選択できるようにする


# 機能一覧

### グループ作成機能
個人用、家族用、老後資金用といったかんじにグループを作成することができます。

メンバーを追加して、共同で資産を管理することができます。


[![Image from Gyazo](https://i.gyazo.com/21134428e5a2c285c703f9652164f1bd.gif)](https://gyazo.com/21134428e5a2c285c703f9652164f1bd)

### 投資情報投稿機能
グループ内に投資情報を投稿することができます。投稿内容はグループ内のメンバーのみ閲覧可能。


[![Image from Gyazo](https://i.gyazo.com/973e6734e0b1901613c21055bf2a73fe.gif)](https://gyazo.com/973e6734e0b1901613c21055bf2a73fe)

### 資産配分のグラフ表示
グラフによりグループごと、または個人の資産配分を把握することができます。

投資商品ごとに小計と投資期間ごとの小計を表示。


[![Image from Gyazo](https://i.gyazo.com/5b052203c12d0fec90226877678658a6.gif)](https://gyazo.com/5b052203c12d0fec90226877678658a6)


### コメント機能
投稿にコメントを残すことができます。


[![Image from Gyazo](https://i.gyazo.com/80412e2f394f742f4aaa4a7908e9ffc8.png)](https://gyazo.com/80412e2f394f742f4aaa4a7908e9ffc8)


# 使用環境・技術

### フロントエンド
・HTML

・CSS

・JavaScript

・Bootstrap 4.5

### バックエンド
・Ruby 2.6.5

・Ruby on Rails 6.0.0

### 本番環境
・AWS(EC2)

・MariaDB

・Unicorn

・Nginx


# テーブル設計

[![Image from Gyazo](https://i.gyazo.com/ff479be058475c4ab32bad05587bf264.png)](https://gyazo.com/ff479be058475c4ab32bad05587bf264)


## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :group_users
- has_many :investments
- has_many :groups, through: group_users


## groups テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :group_users
- has_many :users, through: group_users
- has_many :investments


## group_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| group  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :group


## investments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| group      | references | null: false, foreign_key: true |
| start_time | date       | null: false                    |
| money      | integer    | null: false                    |
| content    | string     | null: false                    |
| type       | integer    | null: false                    |
| account    | integer    | null: false                    |
| period     | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :group


## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| investment | references | null: false, foreign_key: true |

### Association

- belongs_to :investment
- belongs_to :user