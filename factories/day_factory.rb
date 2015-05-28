FactoryGirl.define do
  factory :day do
    date { (rand(Time.zone.now..Time.zone.now + 1.month)).change(usec: 0) }
    name { Faker::Internet.domain_word[1..30] }
  end
end
