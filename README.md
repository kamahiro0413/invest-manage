# カネんだ
積み立て投資管理アプリ

## アプリケーションの概要
積立投資の管理を目的としたアプリです。
自由にグループを作成することができ、個人用、家族用、子供の教育資金といった具合に、ユーザーの生活スタイルに合わせて資産を分けて管理することが可能です。

## URL
http://18.183.0.80/

### Basic認証
ユーザー名: 
パスワード: 

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