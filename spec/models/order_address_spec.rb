require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '商品が購入できる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingが空でも保存できること'do
      @order_address.building = nil
      expect(@order_address).to be_valid
      end
    end

    context '商品が購入できない時' do
      it 'postcodeが空だと保存できないこと' do
        @order_address.postcode = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが数値でないと保存できないこと' do
        @order_address.postcode = "aaa-aaaa"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode はハイフンを含む7桁の番号を入力してください")
      end
      it 'postcodeにハイフンが含まれていないと保存できないこと' do
        @order_address.postcode = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode はハイフンを含む7桁の番号を入力してください")
      end
      it 'prefecture_idが空だと保存できないこと' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが--だと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture は県名を選択してください")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと保存できないこと' do
        @order_address.block = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numが空だと保存できないこと' do
        @order_address.phone_num = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'phone_numが番号でないと保存できないこと' do
        @order_address.phone_num = "aaaaaaaaaaa"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num は電話番号を11桁以内の番号で入力してください")
      end
      it 'phone_numが12桁以上だと保存できないこと' do
        @order_address.phone_num = "090123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num は電話番号を11桁以内の番号で入力してください")
      end
      it 'トークンが空だと保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end