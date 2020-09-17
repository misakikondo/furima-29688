# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| family_name       | string | null: false |
| first_name        | string | null: false |
| family_name_kana  | string | null: false |
| first_name_kana   | string | null: false |
| birth             | string | null: false |

## Association

- has_many :orders
- has_many :items


## items テーブル

| Column            | Type     | Options                         |
| ----------------- | -------- | ------------------------------- |
| item_name         | string   | null: false                     |
| image             | text     | null: false                     |
| explain           | text     | null: false                     |
| category          | string   | null: false                     |
| condition         | string   | null: false                     |
| area              | string   | null: false                     |
| day_to_ship       | string   | null: false                     |
| price             | integer  | null: false                     |
| user_id           | refernces| null: false, foreign_key: true  |

## Association

- has_one :order
- belongs_to :user


## orders テーブル

| Column            | Type     | Options                         |
| ----------------- | -------- | ------------------------------- |
| card_number       | string   | null: false                     |
| expire_month      | string   | null: false                     |
| expire_year       | string   | null: false                     |
| cvc               | string   | null: false                     |
| item_id           | refernces| null: false, foreign_key: true  |
| adress_id         | refernces| null: false, foreign_key: true  |

## Association

- belongs_to :item
- belongs_to :user
- has_one :address


## addresses テーブル

| Column            | Type     | Options                         |
| ----------------- | -------- | ------------------------------- |
| zip_code          | string   | null: false                     |
| state             | string   | null: false                     |
| city              | string   | null: false                     |
| street_number     | string   | null: false                     |
| building_name     | string   |                       　　　　　　|
| phone             | string   | null: false                     |
| adress_id         | refernces| null: false, foreign_key: true  |

## Association

- belongs_to :order

