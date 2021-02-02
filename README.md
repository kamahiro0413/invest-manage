# README

# アプリケーション名 「カネんだ」

## アプリケーションの概要
積立投資の管理を目的としたアプリです。
自由にグループを作成することができ、個人用、家族用、子供の教育資金といった具合に、ユーザーの生活スタイルに合わせて資産を分けて管理することが可能です。

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

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| group   | references | null: false, foreign_key: true |
| date    | date       | null: false                    |
| money   | integer    | null: false                    |
| content | string     | null: false                    |
| type    | integer    | null: false                    |
| account | integer    | null: false                    |
| period  | integer    |                                |

### Association

- belongs_to :user
- belongs_to :group