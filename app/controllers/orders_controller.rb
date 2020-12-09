class OrdersController < ApplicationController
  before_action :move_to_index

  def index
    @item = Item.find(params[:item_id])
    if @item.order.present?
      redirect_to root_path
    else
    @order_address = OrderAddress.new
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    unless user_signed_in?
        redirect_to new_user_session_path
    end
  end
end
