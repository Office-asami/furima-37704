# README

## Users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |

## Association
- has_many :items
- has_many :buyers


## Items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| overview           | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| fee_burden_id      | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| handling_time_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

## Association
- belongs_to  :user
- has_one    :buyer


## Buyers テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

## Association
- belongs_to  :user
- belongs_to  :item
- has_one    :shipping


## Shippings テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| zip_code           | string     | null: false                    |
| prefecture_id      | string     | null: false                    |
| city               | string     | null: false                    |
| address1           | string     | null: false                    |
| address2           | string     |                                |
| telephone          | string     | null: false                    |
| buyers             | references | null: false, foreign_key: true |

## Association
- belongs_to  :buyer