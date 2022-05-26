# README

# テーブル設計

## users テーブル

| Column              | Type    | Options               |
| ------------------- | ------- | --------------------- |
| email               | string  | null: false ユニーク制約|
| encrypted_password  | string  | null: false           |
| nickname            | string  | null: false ユニーク制約|
| name_lastname       | string  | null: false           |
| name_firstname      | string  | null: false           |
| name_kana_lastname  | string  | null: false           |
| name_kana_firstname | string  | null: false           |
| birthdate_year      | integer | null: false           |
| birthdate_month     | integer | null: false           |
| birthdate_day       | integer | null: false           |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options               |
| ------------------ | ---------- | --------------------- |
| name               | string     | null: false           |
| explanation        | text       | null: false           |
| category           | string     | null: false           |
| condition          | string     | null: false           |
| delivery_charge    | string     | null: false           |
| shipping_area      | string     | null: false           |
| days_to_ship       | string     | null: false           |
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
| postal_code        | integer    | null: false           |
| prefecture         | string     | null: false           |
| city               | string     | null: false           |
| address            | string     | null: false           |
| building_name      | string     | null: false           |
| phone_number       | integer    | null: false           |
| order              | references | null: false, foreign_key: true  |

### Association
- belongs_to :order
