# テーブル設計

## usersテーブル

| Colum           |  Type    | Options       |  
| --------------- | -------- | ------------- |  
| nickname        | string   | null: false   | 
| email           | string   | null: false   |
| password        | string   | null: false   |

### Association
  has_one :profile
  has_one :address
  has_many :seller_items, foreign_key: "seller_id", class_name: "items"
  has_many :buyer_items, foreign_key: "buyer_id", class_name: "items

## profilesテーブル
| Colum            | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| first_name       | string     | null: false                    |
| family_name      | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| birth_year       | references | null: false, foreign_key: true |
| birth_month      | references | null: false, foreign_key: true |
| birth_day        | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

### Association
  belongs_to :user
  belongs_to_active_hash :birth_year
  belongs_to_active_hash :birth_month
  belongs_to_active_hash :birth_day

## addressesテーブル
| Colum      | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| postcode   | string     | null: false                    |
| prefecture | integer    | null: false                    |
| city       | string     | null: false                    |
| block      | string     | null: false                    |
| building   | string     |                                |
| phone_num  | string     | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association
  belongs_to :user
  belongs_to_active_hash :prefecture

## itemsテーブル

| Colum        | Type          | Options                        |
| ------------ | ------------- | ------------------------------ |
| item_name    | string        | null: false                    |
| item_text    | text          | null: false                    |
| category     | references    | null: false, foreign_key: true |
| condition    | references    | null: false, foreign_key: true |
| postage      | references    | null: false, foreign_key: true |
| area         | references    | null: false, foreign_key: true |
| shipping_day | references    | null: false, foreign_key: true |
| price        | integer       | null: false                    |
| seller       | references    | null: false, foreign_key: true |
| buyer        | references    | foreign_key: true              |

### Association
belongs_to_active_hash :category
belongs_to_active_hash :item_condition
belongs_to_active_hash :postage
belongs_to_active_hash :area
belongs_to_active_hash :shipping_day
belongs_to :seller, class_name: "User"
belongs_to :buyer, class_name: "User"
