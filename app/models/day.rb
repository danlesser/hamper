class Day < ActiveRecord::Base
  validates :date, presence: true, uniqueness: { scope: :convention }
  validates :name, presence: true, uniqueness: { scope: :convention }
  belongs_to :convention
end
