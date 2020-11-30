class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do

    validates :item_name, :item_text
    with_options numericality: { other_than: 1 } do
      validates :category_id, :condition_id, :postage_id, :prefecture_id, :shipping_day_id
    end 
  end
    belongs_to_active_hash :category
    belongs_to_active_hash :condition
    belongs_to_active_hash :postage
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :shipping_day
    has_one_attached :image
end
