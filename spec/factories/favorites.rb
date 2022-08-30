FactoryBot.define do
  factory :favorite do
    association :comic
    association :user
  end
end