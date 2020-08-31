require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: @user.id)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '出品機能' do
    context '商品出品が出来るとき' do
      it '全て記入されているとき' do
        expect(@item).to be_valid
      end
    end

    context '商品出品が出来ないとき' do
      it '画像が空のとき' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空のとき' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空のとき' do
        @item.describe = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Describe can't be blank")
      end
      it 'カテゴリーの情報が空のとき' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態についての情報が空のとき' do
        @item.status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Status  Select')
      end
      it '配送料の負担についての情報が空のとき' do
        @item.delivery_fee = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee  Select')
      end
      it '発送元の地域についての情報が空のとき' do
        @item.ship_address = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship address  Select')
      end
      it '発送までの日数についての情報が空のとき' do
        @item.ship_date = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship date  Select')
      end
      it '価格についての情報が空のとき' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が、¥300~¥9,999,999の間であること' do
        @item.price = 100
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
