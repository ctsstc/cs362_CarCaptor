# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { 'test' }
    password { 'testpass' }
    email { 'test@email.com' }
  end
end
