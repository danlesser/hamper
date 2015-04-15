require 'rails_helper'

describe Track do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).scoped_to(:convention_id) }
  it { is_expected.to allow_value('Art').for(:name).with_message('Alphanumeric characters (and spaces) only.') }
  it { is_expected.to validate_presence_of(:rank) }
  it { is_expected.to validate_uniqueness_of(:rank).scoped_to(:convention_id) }
  it { is_expected.to belong_to :convention }
end
