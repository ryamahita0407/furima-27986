# テーブル設計

## usersテーブル

| Colum              |  Type        | Options       |  
| ------------------ | ------------ | ------------- |  
| nickname           | string       | null: false   | 
| email              | varchar(255) | null: false   |
| encrypted_password | varchar(255) | null: false   |
| first_name         | string       | null: false   |
| family_name        | string       | null: false   |
| first_name_kana    | string       | null: false   |
| family_name_kana   | string       | null: false   |
| birthday           | date         | null: false   |


### Association
  has_one :profile
  has_one :address
  has_many :seller_items, foreign_key: "seller_id", class_name: "items"
  has_many :buyer_items, foreign_key: "buyer_id", class_name: "items

## ordersテーブル
| Colum         | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postcode      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phone_num     | string     | null: false                    |
| seller        | references | null: false, foreign_key: true |
| buyer         | references | foreign_key: true              |
| item_id       | references | null: false, foreign_key: true |

### Association
  belongs_to :item
  belongs_to_active_hash :prefecture
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"


## itemsテーブル

| Colum           | Type          | Options                        |
| --------------- | ------------- | ------------------------------ |
| item_name       | string        | null: false                    |
| item_text       | text          | null: false                    |
| category_id     | integer       | null: false                    |
| condition_id    | integer       | null: false                    |
| postage_id      | integer       | null: false                    |
| area_id         | integer       | null: false                    |
| shipping_day_id | integer       | null: false                    | 
| price           | integer       | null: false                    |


### Association
belongs_to_active_hash :category
belongs_to_active_hash :item_condition
belongs_to_active_hash :postage
belongs_to_active_hash :area
belongs_to_active_hash :shipping_day