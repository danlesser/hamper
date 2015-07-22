FactoryGirl.define do
  factory :room do
    name { Faker::Company.name }
    public_name { Faker::Company.name }
  end
end
