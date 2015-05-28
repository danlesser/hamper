class Day < ActiveRecord::Base
  validates :date, presence: true, uniqueness: { scope: :convention }, date:
    { after_or_equal_to: proc { Time.zone.now.to_date } }
  validates :name, presence: true, uniqueness: { scope: :convention }, length: { maximum: 30 },
                   format: { with: /\A[[:alpha:]0-9 ]+\z/, message: 'Alphanumeric characters (and spaces) only.' }
  belongs_to :convention
end
