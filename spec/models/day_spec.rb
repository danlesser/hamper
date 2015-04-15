require 'rails_helper'

describe Day do
  it { is_expected.to validate_presence_of :date }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to belong_to :convention }
end
