FactoryBot.define do
  factory :character do
    display_name { '7ara' }
    state { 'active' }

    trait :inactive do
      state { 'inactive' }
    end
  end
end