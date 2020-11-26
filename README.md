# テーブル設計

## usersテーブル

| Colum              |  Type        | Options       |  
| ------------------ | ------------ | ------------- |  
| nickname           | string       | null: false   | 
| email              | string       | null: false   |
| encrypted_password | string       | null: false   |
| first_name         | string       | null: false   |
| family_name        | string       | null: false   |
| first_name_kana    | string       | null: false   |
| family_name_kana   | string       | null: false   |
| birthday           | date         | null: false   |

### Association
  has_many :orders
  has_many :items
  has_many :orders
  has_one: address

## addressesテーブル
| Colum         | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postcode      | string     | null: false                    |
| prefecture_id | integer    | null: false ,foreign_key: true |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phone_num     | string     | null: false                    |

### Association
  belongs_to :user
  belongs_to_active_hash :prefecture

## itemsテーブル

| Colum           | Type          | Options                       |
| --------------- | ------------- | ----------------------------- |
| item_name       | string        | null: false                   |
| item_text       | text          | null: false                   |
| category_id     | integer       | null: false,foreign_key: true |
| condition_id    | integer       | null: false,foreign_key: true |
| postage_id      | integer       | null: false,foreign_key: true |
| area_id         | integer       | null: false,foreign_key: true |
| shipping_day_id | integer       | null: false,foreign_key: true | 
| price           | integer       | null: false                   |
| user            | references    | null: false,foreign_key: true |

### Association
  belongs_to :user
  has_many :orders
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :area
  belongs_to_active_hash :shipping_day

## ordersテーブル
| Colum |  Type      | Options                |
| ----- | ---------- | ---------------------- |
| user  | references | null,foreign_key: true |
| item  | references | null,foreign_key: true |

### Association
  belongs_to :user
  belongs_to :item

