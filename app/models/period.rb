class Period < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択してください (任意)' },
    { id: 2, name: '短期' },
    { id: 3, name: '中期' },
    { id: 4, name: '長期' }
  ]

  include ActiveHash::Associations
  has_many :investments
end
