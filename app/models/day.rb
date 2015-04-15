class Day < ActiveRecord::Base
  validates :date, presence: true
  validates :name, presence: true
  belongs_to :convention
end
