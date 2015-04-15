FactoryGirl.define do
  factory :track do
    name { Faker::Internet.domain_word }
    rank { Faker::Number.number(2) }
  end
end
