FactoryGirl.define do
  factory :convention do
    title { Faker::Internet.domain_word[1..40] }
    convention_email { Faker::Internet.email[1..40] }
    timeslot_duration { Faker::Number.number(2) }
  end
end
