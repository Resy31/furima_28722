require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録が出来るとき' do
      it 'フォームを全て入力している' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
    end

    context '新規登録が出来ないとき' do
      it 'nicknameが空のとき' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空のとき' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在するとき' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'passwordが空のとき' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下のとき' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは英字と数字を含める6~12文字で入力して下さい')
      end
      it 'passwordが半角英数字混合じゃないとき' do
        @user.password = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'last_nameが空のとき' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it 'first_nameが空のとき' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'last_nameが全角ではないとき' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字を全角で入力して下さい')
      end
      it 'first_nameが全角ではないとき' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を全角で入力して下さい')
      end
      it 'last_name_kanaが空のとき' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字カナを入力してください")
      end
      it 'first_name_kanaが空のとき' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナを入力してください")
      end
      it 'last_name_kanaが全角(カナ)ではないとき' do
        @user.last_name_kana = 'aaa'
        @user.last_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字カナを全角カタカナで入力して下さい')
      end
      it 'first_nameが全角（カナ）ではないとき' do
        @user.first_name_kana = 'aaa'
        @user.first_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前カナを全角カタカナで入力して下さい')
      end
      it 'birth_dateが空だと登録できない' do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
