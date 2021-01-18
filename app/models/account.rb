class Account < ActiveHash::Base
  self.data = [
    { id: 1,  name: '----------------' },
    { id: 2,  name: '三菱UFJ銀行' },
    { id: 3,  name: '楽天銀行' },
    { id: 4,  name: '住信SBIネット銀行' },
    { id: 5,  name: '楽天証券' },
    { id: 6,  name: 'SBI証券' },
    { id: 7,  name: 'SBIネオモバイル証券' },
    { id: 8,  name: 'SMBC日興証券' },
    { id: 9,  name: 'Coincheck' },
    { id: 10, name: 'bitFlyer' },
    { id: 11, name: '貯金箱' },
    { id: 12, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :investments
  
end
