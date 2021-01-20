class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :group

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :account
  belongs_to :period

  with_options presence: true do
  validates :start_time
  validates :money
  validates :category_id, numericality: { other_than: 1 , message: 'を選択してください' }
  validates :account_id, numericality: { other_than: 1 , message: 'を選択してください' } 
  validates :period_id
  end
end
