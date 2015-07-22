FactoryGirl.define do
  factory :room do
    name { Faker::Address.city }
    public_name { Faker::Address.city }
  end
end
