FactoryBot.define do
  factory :investment do
    start_time  { '2021-01-14' }
    money       { '100' }
    content     { 'お小遣い' }
    category_id { '2' }
    account_id  { '2' }
    period_id   { '2' }
    association :user
    association :group
  end
end
