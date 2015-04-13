FactoryGirl.define do
  factory :convention do
    title { Faker::Internet.domain_word }
    convention_email { Faker::Internet.email }
    timeslot_duration { Faker::Number.number(2) }
  end
end
