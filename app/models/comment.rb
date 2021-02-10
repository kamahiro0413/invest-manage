class Comment < ApplicationRecord
  belongs_to :investment
  belongs_to :user

  validates :text, presence: true
end
