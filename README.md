# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| encrypted_password| string | null: false |
| family_name       | string | null: false |
| first_name        | string | null: false |
| family_name_kana  | string | null: false |
| first_name_kana   | string | null: false |
| birth             | date   | null: false |

## Association

- has_many :orders
- has_many :items


## items テーブル

| Column               | Type      | Options                         |
| -------------------- | --------- | ------------------------------- |
| items_name           | string    | null: false                     |
| explains             | text      | null: false                     |
| categories_id        | integer   | null: false                     |
| conditions_id        | integer   | null: false                     |
| shipping_methods_id  | integer   | null: false                     |
| items_location_id    | integer   | null: false                     |
| days_to_ship_id      | integer   | null: false                     |
| price                | integer   | null: false                     |
| user                 | references| null: false, foreign_key: true  |

## Association

- has_one :order
- belongs_to :user
- belongs_to_active_hash :categories
- belongs_to_active_hash :conditions
- belongs_to_active_hash :shipping_methods
- belongs_to_active_hash :items_location
- belongs_to_active_hash :days_to_ship


## orders テーブル

| Column            | Type      | Options                         |
| ----------------- | --------- | ------------------------------- |
| item              | references| null: false, foreign_key: true  |
| user              | references| null: false, foreign_key: true  |

## Association

- belongs_to :item
- belongs_to :user
- has_one :address


## addresses テーブル

| Column            | Type      | Options                         |
| ----------------- | --------- | ------------------------------- |
| zip_code          | string    | null: false                     |
| prefecture        | integer   | null: false                     |
| city              | string    | null: false                     |
| block             | string    | null: false                     |
| building_name     | string    |                       　　　　　　|
| phone             | string    | null: false                     |
| order             | references| null: false, foreign_key: true  |

## Association

- belongs_to :order
- belongs_to_active_hash :prefecture
