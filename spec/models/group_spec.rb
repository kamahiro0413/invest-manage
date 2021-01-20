require 'rails_helper'

RSpec.describe Group, type: :model do
  describe '新規グループ作成' do
    before do
      @group = FactoryBot.build(:group)
    end

    it "nameがあれば作成できる" do
      expect(@group).to be_valid
    end

    it "nameが空では登録できないこと" do
      @group.name = nil
      @group.valid?
      expect(@group.errors.full_messages).to include("Nameを入力してください")
    end
  end
end
