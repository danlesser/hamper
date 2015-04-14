class Day < ActiveRecord::Base
  validates :date, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  belongs_to :convention
end
