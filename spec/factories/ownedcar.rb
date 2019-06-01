# frozen_string_literal: true

FactoryBot.define do
  factory :ownedcar do
    trait :civic do
      year { 2001 }
      make { 'Honda' }
      model { 'Civic' }
      coolness_value { 1 }
      horsepower { 190 }
      torque { 220 }
      weight { 3690 }
    end

    trait :ae86 do
      year { 1986 }
      make { 'Toyota' }
      model { 'AE86' }
      coolness_value { 100 }
      horsepower { 190 }
      torque { 115 }
      weight { 2200 }
    end

    trait :ford_explorer do
      year { 1999 }
      make {'Ford' }
      model { 'Explorer' }
      coolness_value { 1 }
      horsepower { 160 }
      torque { 225 }
      weight { 3891 }
    end
  end
end
