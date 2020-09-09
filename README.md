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

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_date      | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| name          | string  | null: false |
| describe      | string  | null: false |
| category      | integer | null: false |
| status        | integer | null: false |
| delivery_fee  | integer | null: false |
| ship_address  | integer | null: false |
| ship_date     | integer | null: false |
| price         | string  | null: false |
| user_id       | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

##  purchasesテーブル 中間テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | reference  | null: false, foreign_key: true |
| item         | reference  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

##  addressesテーブル 

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| zip_code     | string     | null: false |
| ship_address | integer    | null: false |
| city         | string     | null: false |
| house_number | string     | null: false |
| apartment    | string     |             |
| phone_number | string     | null: false |

- belongs_to :purchase