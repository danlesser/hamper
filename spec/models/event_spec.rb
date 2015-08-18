require 'rails_helper'

describe Event do
  it { is_expected.to belong_to :convention }
  it { is_expected.to belong_to :day }
  it { is_expected.to belong_to :room }
  it { is_expected.to belong_to :track }
  it { is_expected.to validate_presence_of :timetable_name }
  it { is_expected.to validate_length_of(:conbook_description).is_at_most(500) }
  it { is_expected.to validate_presence_of :start_time }
  it { is_expected.to validate_presence_of :setup_duration }
  it { is_expected.to validate_presence_of :seating_duration }
  it { is_expected.to validate_presence_of :event_duration }
  it { is_expected.to validate_presence_of :teardown_duration }
  it { is_expected.to validate_length_of(:timetable_name).is_at_most(50) }
  it { is_expected.to validate_presence_of :conbook_name }
  it { is_expected.to validate_length_of(:conbook_name).is_at_most(50) }
  it { is_expected.to validate_length_of(:room_layout).is_at_most(100) }
  it { is_expected.to validate_length_of(:convention_equipment).is_at_most(500) }
  it { is_expected.to validate_length_of(:hotel_equipment).is_at_most(500) }
  it { is_expected.to validate_length_of(:event_runners).is_at_most(200) }
  it { is_expected.to validate_length_of(:notes).is_at_most(10_000) }

  it do
    is_expected.to allow_value('Dance: SFW Part 2').for(:timetable_name)
      .with_message('Alphanumeric characters, spaces, and sensible punctuation only.')
  end

  it do
    is_expected.to allow_value('Dance: SFW Part 2').for(:conbook_name)
      .with_message('Alphanumeric characters, spaces, and sensible punctuation only.')
  end

  it do
    is_expected.to allow_value('Dance: SFW Part 2').for(:conbook_description)
      .with_message('Alphanumeric characters, spaces, and sensible punctuation only.')
  end

  it do
    is_expected.to allow_value('Dance: SFW Part 2').for(:room_layout)
      .with_message('Alphanumeric characters, spaces, and sensible punctuation only.')
  end

  it do
    is_expected.to allow_value('Dance: SFW Part 2').for(:convention_equipment)
      .with_message('Alphanumeric characters, spaces, and sensible punctuation only.')
  end

  it do
    is_expected.to allow_value('Dance: SFW Part 2').for(:hotel_equipment)
      .with_message('Alphanumeric characters, spaces, and sensible punctuation only.')
  end

  it do
    is_expected.to allow_value('Dance: SFW Part 2').for(:event_runners)
      .with_message('Alphanumeric characters, spaces, and sensible punctuation only.')
  end

  it do
    is_expected.to allow_value('Dance: SFW Part 2').for(:notes)
      .with_message('Alphanumeric characters, spaces, and sensible punctuation only.')
  end

  describe '#formatted_start_time' do
    it 'formats the start_time as HH:MM' do
      event = create :event
      expect(event.formatted_start_time).to eq event.start_time.to_s(:time)
    end
  end
end
