FactoryGirl.define do
  factory :track do
    name { Faker::Internet.domain_word[1..40] }
    rank { Faker::Number.number(2) }
  end
end
