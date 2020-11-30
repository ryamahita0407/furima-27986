class Item < ApplicationRecord
  with_options presence: true do

    validates :item_name, :item_text
    with_options numericality: { other_than: 1 } do
      validates :category_id, :condition_id, :postage_id, :prefecture_id, :shipping_day_id
    end 

    belongs_to :category
    belongs_to :condition
    belongs_to :postage
    belongs_to :prefecture
    belongs_to :shipping_day
  end
end
