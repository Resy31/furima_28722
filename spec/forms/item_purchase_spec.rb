require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
    @item.save
    @purchase = FactoryBot.build(:item_purchase, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '商品購入が出来るとき' do
      it 'フォームを全て入力している' do
        expect(@purchase).to be_valid
      end
    end

    context '商品購入が出来ないとき' do
      it 'クレジット情報が正しく入力されていないとき' do
      end
      it 'クレジット情報が空のとき' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空のとき' do
        @purchase.zip_code = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Zip code can't be blank")
      end
      it '郵便番号にハイフンがないとき' do
        @purchase.zip_code = 1_234_567
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Zip code Input correctly')
      end
      it '都道府県が空のとき' do
        @purchase.ship_address_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Ship address Select')
      end
      it '市区町村が空のとき' do
        @purchase.city = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空のとき' do
        @purchase.house_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空のとき' do
        @purchase.phone_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が10桁又は11桁ではないとき' do
        @purchase.phone_number = 12_345
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
