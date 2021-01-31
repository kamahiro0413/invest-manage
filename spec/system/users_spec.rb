require 'rails_helper'

RSpec.describe 'ユーザーの新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context '新規登録できるとき' do

    it '正しい情報を入力すれば新規登録が完了しトップページに移動する' do
      # トップページに移動
      visit root_path
      # トップページに新規登録ボタンがあることを確認
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動
      visit new_user_registration_path
      # ユーザー情報を入力
      fill_in 'user_nickname', with: @user.nickname
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: @user.password_confirmation
      # 登録ボタンを押すとユーザーモデルのカウントが1上がることを確認
      expect{find('input[name="commit"]').click}.to change { User.count }.by(1)
      # トップページへ移動
      expect(current_path).to eq root_path
      # ログアウトボタンがあることを確認
      expect(page).to have_content('ログアウト')
      # 新規登録ボタンや、ログインボタンが表示されていないことを確認
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end

  context '新規登録できないとき' do

    it '誤った情報では新規登録できず新規登録ページにとどまる' do
      # トップページに移動
      visit root_path
      # トップページに新規登録ボタンがあることを確認
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動
      visit new_user_registration_path
      # ユーザー情報を入力
      fill_in 'user_nickname', with: ""
      fill_in 'user_email', with: ""
      fill_in 'user_password', with: ""
      fill_in 'user_password_confirmation', with: ""
      # 登録ボタンを押してもユーザーモデルのカウントは上がらないことを確認
      expect{find('input[name="commit"]').click}.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq "/users" 
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ログインができるとき' do

    it '保存されているユーザーの情報と合致すればログインができる' do
      # トップページに移動
      visit root_path
      # トップページにログインボタンがあることを確認
      expect(page).to have_content('ログイン')
      # ログインページへ移動
      visit new_user_session_path
      # 正しいユーザー情報を入力
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # トップページに移動することを確認
      expect(current_path).to eq root_path
      # ログアウトボタンがあることを確認
      expect(page).to have_content('ログアウト')
      # 新規登録ボタンや、ログインボタンが表示されていないことを確認
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end

  context 'ログインができないとき' do

    it '保存されているユーザーの情報と合致しないとログインができない' do
      # トップページに移動
      visit root_path
      # トップページにログインボタンがあることを確認
      expect(page).to have_content('ログイン')
      # ログインページへ移動
      visit new_user_session_path
      # ユーザー情報を入力
      fill_in 'user_email', with: ""
      fill_in 'user_password', with: ""
      # ログインボタンを押す
      find('input[name="commit"]').click
      # ログインページへ戻されることを確認する
      expect(current_path).to eq new_user_session_path
    end
  end
end
