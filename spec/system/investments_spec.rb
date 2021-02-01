require 'rails_helper'

RSpec.describe "投資情報投稿機能", type: :system do
  before do
    @group_user = FactoryBot.create(:group_user)
  end

  context '投稿ができるとき' do

    it '投資情報の入力が成功すると、一覧ページへ移動し、入力内容が表示されている' do
    # サインインする
    sign_in(@group_user.user)
    # 作成されたグループへ移動
    click_on(@group_user.group.name)
    # 投資情報入力ページへ移動
    click_on('情報を入力')
    # 投資情報を入力
    fill_in 'investment_start_time', with: '002021,02,02'
    fill_in 'investment_money', with: '1234'
    fill_in 'investment_content', with: 'testtext'
    select '貯金', from: 'investment[category_id]'
    select '楽天銀行', from: 'investment[account_id]'
    select '短期', from: 'investment[period_id]' 
    # 入力完了ボタンを押し、DBに保存されていることを確認
    expect{find('input[name="commit"]').click}.to change { Investment.count }.by(1)
    # 投稿カレンダー画面に遷移していることを確認
    expect(current_path).to eq group_investments_path(@group_user.group)
    end
  end

  context '投稿ができないとき' do

    it '投資情報を空のまま送信すると、投稿ができない' do
    # サインインする
    sign_in(@group_user.user)
    # 作成されたグループへ移動
    click_on(@group_user.group.name)
    # 投資情報入力ページへ移動
    click_on('情報を入力')
    # 何も入力してない状態で入力完了ボタンを押し、DBに保存されていないことを確認
    expect{find('input[name="commit"]').click}.not_to change { Investment.count }
    # 元のページに戻ってくることを確認
    expect(current_path).to eq group_investments_path(@group_user.group)
    end
  end
end
