FactoryGirl.define do
  factory :event do
    timetable_name { Faker::Internet.domain_word }
    conbook_name { Faker::Internet.domain_word }
    conbook_description { Faker::Internet.domain_word }
    start_time { (rand(Time.zone.now..Time.zone.now + 1.month)).change(usec: 0) }
    setup_duration { Faker::Number.number(2) }
    seating_duration { Faker::Number.number(2) }
    event_duration { Faker::Number.number(2) }
    teardown_duration { Faker::Number.number(2) }
    room_layout { Faker::Internet.domain_word }
    convention_equipment { Faker::Internet.domain_word }
    hotel_equipment { Faker::Internet.domain_word }
    notes { Faker::Internet.domain_word }
  end
end
