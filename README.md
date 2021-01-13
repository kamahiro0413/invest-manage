# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

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