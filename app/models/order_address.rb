class OrderAddress
  
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_num, :user_id, :item_id

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1, message: "は県名を入力してください" }
    validates :city, :block, :phone_num
    validates :postcode, format: {with: /\A\d{3}[-]\d{4}\z/, message: "は7桁の番号を入力してください"}
  end

  def save
    @order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_num: phone_num, order_id: @order.id)
  end
end