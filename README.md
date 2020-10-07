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
- has_many :comments


## items テーブル

| Column               | Type      | Options                         |
| -------------------- | --------- | ------------------------------- |
| items_name           | string    | null: false                     |
| explains             | text      | null: false                     |
| category_id          | integer   | null: false                     |
| condition_id         | integer   | null: false                     |
| shipping_method_id   | integer   | null: false                     |
| item_location_id     | integer   | null: false                     |
| days_to_ship_id      | integer   | null: false                     |
| price                | integer   | null: false                     |
| user                 | references| null: false, foreign_key: true  |

## Association

- has_one :order
- belongs_to :user
- has_many :comments
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_method
- belongs_to_active_hash :item_location
- belongs_to_active_hash :days_to_ship

## comments テーブル

| Column            | Type      | Options                         |
| ----------------- | --------- | ------------------------------- |
| item              | references| null: false, foreign_key: true  |
| user              | references| null: false, foreign_key: true  |
| text              | text      | null:false                      |

## Association
 - belongs_to :item
 - belongs_to :user



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
| building_name     | string    |                                 |
| phone             | string    | null: false                     |
| order             | references| null: false, foreign_key: true  |

## Association

- belongs_to :order
- belongs_to_active_hash :prefecture
