require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: @user.id)
    @item.images = fixture_file_upload('public/images/test_image.png')
  end

  describe '出品機能' do
    context '商品出品が出来るとき' do
      it '全て記入されているとき' do
        expect(@item).to be_valid
      end
    end

    context '商品出品が出来ないとき' do
      it '画像が空のとき' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it '商品名が空のとき' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明が空のとき' do
        @item.describe = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'カテゴリーの情報が空のとき' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択して下さい")
      end
      it '商品の状態についての情報が空のとき' do
        @item.status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択して下さい')
      end
      it '配送料の負担についての情報が空のとき' do
        @item.delivery_fee = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択して下さい')
      end
      it '発送元の地域についての情報が空のとき' do
        @item.ship_address = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択して下さい')
      end
      it '発送までの日数についての情報が空のとき' do
        @item.ship_date = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択して下さい')
      end
      it '価格についての情報が空のとき' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it '価格が300円未満のとき' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('価格が設定範囲外です')
      end
      it '価格が10,000,000円以上のとき' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('価格が設定範囲外です')
      end
    end
  end
end
