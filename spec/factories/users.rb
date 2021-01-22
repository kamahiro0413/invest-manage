FactoryBot.define do
  factory :user do
    nickname              { 'testuser' }
    email                 { 'test@email.com' }
    password              { '123456' }
    password_confirmation { password }
  end
end
