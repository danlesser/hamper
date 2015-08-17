require 'rails_helper'

describe Event do
  it { is_expected.to belong_to :convention }
  it { is_expected.to belong_to :day }
  it { is_expected.to belong_to :room }
  it { is_expected.to belong_to :track }
end
