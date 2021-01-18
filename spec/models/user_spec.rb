require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '登録できるとき' do

      it'すべての値が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end 
    end

    context '登録できないとき' do

      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前を入力してください")
      end

      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it 'emailは＠を含めないと登録できない' do
        @user.email = "email.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end

      it 'すでに登録されているemailは登録できない' do
        @user.save
        @another_user = FactoryBot.build(:user, email: @user.email)
        @another_user.valid?
        expect(@another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end

      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordが5文字以下だと登録できない' do
        @user.password = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password = "123456"
        @user.password_confirmation = "654321"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
end
