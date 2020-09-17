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
| birth             | date   | null: false |

## Association

- has_many :orders
- has_many :items


## items テーブル

| Column            | Type     | Options                         |
| ----------------- | -------- | ------------------------------- |
| item_name         | string   | null: false                     |
| explain           | text     | null: false                     |
| category          | integer  | null: false                     |
| condition         | integer  | null: false                     |
| shipping_method   | integer  | null: false
| item_location     | integer  | null: false                     |
| day_to_ship       | integer  | null: false                     |
| price             | integer  | null: false                     |
| user              | refernces| null: false, foreign_key: true  |

## Association

- has_one :order
- belongs_to :user


## orders テーブル

| Column            | Type     | Options                         |
| ----------------- | -------- | ------------------------------- |
| item              | refernces| null: false, foreign_key: true  |
| user              | refernces| null: false, foreign_key: true  |

## Association

- belongs_to :item
- belongs_to :user
- has_one :address


## addresses テーブル

| Column            | Type     | Options                         |
| ----------------- | -------- | ------------------------------- |
| zip_code          | string   | null: false                     |
| state             | integer  | null: false                     |
| city              | string   | null: false                     |
| street_number     | string   | null: false                     |
| building_name     | string   |                       　　　　　　|
| phone             | string   | null: false                     |
| order             | refernces| null: false, foreign_key: true  |

## Association

- belongs_to :order

