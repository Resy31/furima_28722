require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactryBot.build(:user)
  end

  describe 'ユーザー新規登録'
    context '新規登録が出来ないとき' do
      it "nicknameが空のとき" do
      end
      it "emailが空のとき" do
      end
      it "重複したemailが存在するとき" do
      end
      it "emailに@がないとき" do
      end
      it "passwordが空のとき" do
      end
      it "passwordが5文字以下のとき" do
      end
      it "passwordが半角英数字混合じゃないとき" do
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
      end
      it "last_nameが空のとき" do
      end
      it "first_nameが空のとき" do
      end
      it "last_nameとfirst_nameが全角ではないとき" do
      end
      it "last_name_kanaが空のとき" do
      end
      it "first_name_kanaが空のとき" do
      end
      it "last_name_kanaとfirst_name_kanaが全角(カナ)ではないとき" do
      end
      it "birth_dateが空のとき"
      end
    end
  end
end
