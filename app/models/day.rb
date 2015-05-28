class Day < ActiveRecord::Base
  validates :date, presence: true, uniqueness: { scope: :convention }, date:
    { after_or_equal_to: proc { Time.zone.now.to_date } }
  validates :name, presence: true, uniqueness: { scope: :convention }, length: { maximum: 20 }
  belongs_to :convention
end
