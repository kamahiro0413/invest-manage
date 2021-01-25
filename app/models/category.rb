class Category < ActiveHash::Base
  self.data = [
    { id: 1,  name: '選択してください' },
    { id: 2,  name: '貯金' },
    { id: 3,  name: '国内株式' },
    { id: 4,  name: '外国株式' },
    { id: 5,  name: '投資信託' },
    { id: 6,  name: '債券' },
    { id: 7,  name: 'コモディティ' },
    { id: 8,  name: '暗号資産' },
    { id: 9,  name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :investments
end
