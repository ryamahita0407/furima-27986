class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do

    validates :item_name, :item_text, :image
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
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
    belongs_to :user
end
