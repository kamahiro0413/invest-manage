require 'rails_helper'

RSpec.describe Investment, type: :model do
  describe '投資情報の登録' do
    before do
      @investment = FactoryBot.build(:investment)
    end

    context '登録できるとき' do
      it 'すべての情報をただしく入力すると登録される' do
        expect(@investment).to be_valid
      end

      it 'contentが空でも登録できる' do
        @investment.content = nil
        expect(@investment).to be_valid
      end

      it 'period_idの選択肢がデフォルト(id:1)のままでも登録できる' do
        @investment.period_id = 1
        expect(@investment).to be_valid
      end
    end

    context '登録できないとき' do
      it 'userと紐付いてないと登録できない' do
        @investment.user = nil
        @investment.valid?
        expect(@investment.errors.full_messages).to include('Userを入力してください')
      end

      it 'groupと紐付いてないと登録できない' do
        @investment.group = nil
        @investment.valid?
        expect(@investment.errors.full_messages).to include('Groupを入力してください')
      end

      it 'start_timeが空だと登録できない' do
        @investment.start_time = nil
        @investment.valid?
        expect(@investment.errors.full_messages).to include('Start timeを入力してください')
      end

      it 'moneyが空だと登録できない' do
        @investment.money = nil
        @investment.valid?
        expect(@investment.errors.full_messages).to include('Moneyを入力してください')
      end

      it 'category_idが空だと登録できない' do
        @investment.category_id = nil
        @investment.valid?
        expect(@investment.errors.full_messages).to include('Categoryを入力してください')
      end

      it 'category_idの選択肢がデフォルト(id:1)のままだと登録できない' do
        @investment.category_id = 1
        @investment.valid?
        expect(@investment.errors.full_messages).to include('Categoryを選択してください')
      end

      it 'account_idが空だと登録できない' do
        @investment.account_id = nil
        @investment.valid?
        expect(@investment.errors.full_messages).to include('Accountを入力してください')
      end

      it 'account_idの選択肢がデフォルト(id:1)のままだと登録できない' do
        @investment.account_id = 1
        @investment.valid?
        expect(@investment.errors.full_messages).to include('Accountを選択してください')
      end

      it 'period_idが空だと登録できない' do
        @investment.period_id = nil
        @investment.valid?
        expect(@investment.errors.full_messages).to include('Periodを入力してください')
      end
    end
  end
end
