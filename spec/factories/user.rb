FactoryBot.define do
  factory :user do
    username { 'test' }
    password { 'testpass' }
    email { 'test@email.com' }
  end
end