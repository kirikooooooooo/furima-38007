# README

# テーブル設計

## users テーブル

| Column              | Type    | Options                 |
| ------------------- | ------- | ----------------------- |
| email               | string  | null: false,unique: true|
| encrypted_password  | string  | null: false             |
| nickname            | string  | null: false             |
| name_lastname       | string  | null: false             |
| name_firstname      | string  | null: false             |
| name_kana_lastname  | string  | null: false             |
| name_kana_firstname | string  | null: false             |
| birthdate           | date    | null: false             |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options               |
| ------------------ | ---------- | --------------------- |
| name               | string     | null: false           |
| explanation        | text       | null: false           |
| category_id        | integer    | null: false           |
| condition_id       | integer    | null: false           |
| delivery_charge_id | integer    | null: false           |
| shipping_area_id   | integer    | null: false           |
| days_to_ship_id    | integer    | null: false           |
| price              | integer    | null: false           |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## orders テーブル

| Column     | Type       | Options                         |
| ---------- | ---------- | ------------------------------- |
| user       | references | null: false, foreign_key: true  |
| item       | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :order
- has_one :address



## addresses テーブル

| Column             | Type       | Options               |
| ------------------ | ---------- | --------------------- |
| postal_code        | string     | null: false           |
| prefecture_id      | integer    | null: false           |
| city               | string     | null: false           |
| address            | string     | null: false           |
| building_name      | string     |                       |
| phone_number       | string     | null: false           |
| order              | references | null: false, foreign_key: true  |

### Association
- belongs_to :order
