require 'rails_helper'

RSpec.describe "グループの削除機能", type: :system do
  before do
    @group_user = FactoryBot.create(:group_user)
  end

  it 'グループを削除すると、関連の投稿情報がすべて削除される' do
  # サインインする
  sign_in(@group_user.user)
  # 作成されたグループへ移動
  click_on(@group_user.group.name)
  # 投稿情報を２個保存
  FactoryBot.create_list(:investment, 2, group_id: @group_user.group.id, user_id: @group_user.user.id )
  # グループ情報ページへ移動
  click_on('グループ情報')
  # グループ情報編集ページへ移動
  find('i[class="fas fa-cog"]').click
  # ゴミ箱ボタンを押す
  find('i[class="fas fa-trash-alt fa-3x"]').click
  # 削除の確認アラートに同意する
  page.driver.browser.switch_to.alert.accept
  # トップページに遷移していることを確認する
  expect(current_path).to eq root_path
  end
end
