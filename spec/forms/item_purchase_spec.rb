require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.images = fixture_file_upload('public/images/test_image.png')
    @item.save
    @purchase = FactoryBot.build(:item_purchase, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '商品購入が出来るとき' do
      it 'フォームを全て入力している' do
        expect(@purchase).to be_valid
      end
      it '建物名が空のとき' do
        @purchase.apartment = nil
        expect(@purchase).to be_valid
      end
    end

    context '商品購入が出来ないとき' do
      it 'クレジット情報が正しく入力されていないとき' do
      end
      it 'クレジット情報が空のとき' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it '郵便番号が空のとき' do
        @purchase.zip_code = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号にハイフンがないとき' do
        @purchase.zip_code = 1_234_567
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('郵便番号を正しく入力して下さい')
      end
      it '郵便番号が9桁のとき' do
        @purchase.zip_code = 1234 - 56_789
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('郵便番号を正しく入力して下さい')
      end
      it '郵便番号が5桁のとき' do
        @purchase.zip_code = 12 - 345
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('郵便番号を正しく入力して下さい')
      end
      it '都道府県が空のとき' do
        @purchase.ship_address_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('都道府県を選択して下さい')
      end
      it '市区町村が空のとき' do
        @purchase.city = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地が空のとき' do
        @purchase.house_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空のとき' do
        @purchase.phone_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号が10桁又は11桁ではないとき' do
        @purchase.phone_number = 12_345
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('電話番号は不正な値です')
      end
    end
  end
end
