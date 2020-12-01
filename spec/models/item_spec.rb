require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '商品の登録がうまくいった時' do
      it "全ての項目が記入されている時登録できる" do
        expect(@item).to be_valid
      end
    end
    context '商品の登録がうまく行かなかったとき' do
      it "画像が添付されていないとき商品が登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "item_nameが空のとき登録できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "item_textが空のとき登録できない" do
        @item.item_text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item text can't be blank")
      end
      it "category_idが--のとき登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "condition_idが--のとき登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "postage_idが--のとき登録できない" do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 1")
      end
      it "prefecture_idが--のとき登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "shipping_day_idが--のとき登録できない" do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end
      it "priceが空のとき登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが¥299以下のとき登録できない" do
        @item.price = 299
        @item.valid?
        binding.pry
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが¥10,000,000以上のとき登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "priceは半角数字ではないとき登録できない" do
        @item.price = '９９９'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
