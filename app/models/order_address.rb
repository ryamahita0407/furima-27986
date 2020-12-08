class OrderAddress
  
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_num, :user_id, :item_id, :token

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1, message: "は県名を選択してください" }
    validates :phone_num, format: {with: /\A\d{10}$|^\d{11}\z/, message:"は電話番号を11桁以内の番号で入力してください"}
    validates :city, :block, :token
    validates :postcode, format: {with: /\A\d{3}[-]\d{4}\z/, message: "はハイフンを含む7桁の番号を入力してください"}
  end

  def save
    @order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_num: phone_num, order_id: @order.id)
  end
end