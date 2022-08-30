FactoryBot.define do
  factory :comic do
    title {Faker::Book.title}
    author {Faker::Name.name}
    volume {Faker::Number.between(from: 1, to: 200)}
    target_age_id {Faker::Number.between(from: 1, to: 6)}
    genre_id {Faker::Number.between(from: 1, to: 15)}
    memo {"こんにちは"}
    completion {Faker::Number.between(from: 0, to: 1)}
    association :user
  end
end