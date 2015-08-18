require 'rails_helper'

describe Event do
  it { is_expected.to belong_to :convention }
  it { is_expected.to belong_to :day }
  it { is_expected.to belong_to :room }
  it { is_expected.to belong_to :track }

  describe '#formatted_start_time' do
    it 'formats the start_time as HH:MM' do
      event = create :event
      expect(event.formatted_start_time).to eq event.start_time.to_s(:time)
    end

    it 'returns nil if the start_time is nil' do
      event = create(:event, start_time: nil)
      expect(event.formatted_start_time).to be_nil
    end
  end
end
