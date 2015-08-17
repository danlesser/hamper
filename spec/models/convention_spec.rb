require 'rails_helper'

describe Convention do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_uniqueness_of(:title) }
  it { is_expected.to validate_length_of(:title).is_at_most(40) }
  it { is_expected.to allow_value('ConFuzzled 2015').for(:title).with_message('Alphanumeric characters (and spaces) only.') }
  it { is_expected.to validate_presence_of :convention_email }
  it { is_expected.to validate_uniqueness_of(:convention_email) }
  it { is_expected.to validate_length_of(:convention_email).is_at_most(40) }
  it { is_expected.to validate_email_format_of(:convention_email).with_message('Valid email addresses only.') }
  it { is_expected.to have_many :days }
  it { is_expected.to have_many :tracks }
  it { is_expected.to have_many :rooms }
  it { is_expected.to have_many :events }
end
