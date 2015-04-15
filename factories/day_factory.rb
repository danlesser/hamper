FactoryGirl.define do
  factory :day do
    date { (rand(100.days.ago..5.minute.ago)).change(usec: 0).to_s }
    name { Faker::Internet.domain_word }
  end
end
