class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :date ,presence: true
  validates :money ,presence: true
end
