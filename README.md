# README

## Users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_year         | string | null: false |
| birth_month        | string | null: false |
| birth_day          | string | null: false |

## Association
- has_many :items
- has_many :buyers


## Items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| text               | text       | null: false                    |
| category           | string     | null: false                    |
| status             | string     | null: false                    |
| fee_burden         | string     | null: false                    |
| area               | string     | null: false                    |
| handling_time      | string     | null: false                    |
| price              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

## Association
- belong_to  :users
- has_one    :buyers


## Buyers テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

## Association
- belong_to  :users
- belong_to  :items
- has_one    :shipping


## Shipping テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| zip_code           | string     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| address1           | string     | null: false                    |
| address2           | string     | null: false                    |
| telephone          | string     | null: false                    |
| buyers_id          | references | null: false, foreign_key: true |

## Association
- belong_to  :buyers