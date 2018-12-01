FactoryBot.define do
  factory :user do
    sequence :email do |n|
    "person#{n}@pixie.com"
    end
    password { 'password' }
    password_confirmation { 'password' }

    trait :admin do
      admin { true }
    end
  end
end
