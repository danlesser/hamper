require 'rails_helper'

describe Day do
  it { is_expected.to validate_presence_of :date }
  it { is_expected.to validate_uniqueness_of(:date).scoped_to(:convention_id) }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of(:name).scoped_to(:convention_id) }
  it { is_expected.to validate_length_of(:name).is_at_most(20) }
  it { is_expected.to belong_to :convention }
end
