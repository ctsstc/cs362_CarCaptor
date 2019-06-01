# frozen_string_literal: true

FactoryBot.define do
  factory :car do
    year { 1900 }
    make { 'Some' }
    model { 'Turd' }
    coolness_value { 1 }
    horsepower { 20 }
    torque { 20 }
    weight { 6000 }
  end
end
