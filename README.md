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

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| name_kana  | string | null: false |
| birth_date | string | null: false |
| user_id    | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| item_name     | string | null: false |
| item_describe | string | null: false |
| category      | string | null: false |
| status        | string | null: false |
| delivery_fee  | string | null: false |
| ship_address  | string | null: false |
| ship_date     | string | null: false |
| price         | string | null: false |
| user          | string | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase

##  purchasesテーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| zip_code     | string     | null: false |
| state        | string     | null: false |
| city         | string     | null: false |
| house_number | string     | null: false |
| apartment    | string     |             |
| phone_number | string     | null: false |
| user          | string | null: false, foreign_key: true |
| item          | string | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase
