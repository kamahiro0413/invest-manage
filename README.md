# カネんだ
積み立て投資管理アプリ

## アプリケーションの概要
積立投資の管理を目的としたアプリです。
自由にグループを作成することができ、個人用、家族用、子供の教育資金といった具合に、ユーザーの生活スタイルに合わせて資産を分けて管理することが可能です。

### グループ作成機能
個人用、家族用、老後資金用といったかんじにグループを作成することができます。

メンバーを追加して、共同で資産を管理することができます。

### 投資情報投稿機能
グループ内に投資情報を投稿することができます。投稿内容はグループ内のメンバーのみ閲覧可能。

### 資産配分のグラフ表示
グラフによりグループごと、または個人の資産配分を把握することができます。

投資商品ごとに小計と投資期間ごとの小計を表示。

## URL
http://18.183.0.80/

### Basic認証
ユーザー名: kamahiro

パスワード: 0413

### テスト用アカウント
メールアドレス: abc@kanenda.com

パスワード: 123456

## 課題解決
将来が不安で投資を始めたけど資産管理がうまくできない方の資産状況を把握しやすくすることを目的に作成しました。グループを作成し、入力フォームから簡単に投稿できます。カレンダー上に表示されるので、いつ投資したのかもすぐわかります。

# テーブル設計

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
