class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :group

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
  validates :start_time
  validates :money
  validates :category_id, numericality: { other_than: 1 } 
  end
end
