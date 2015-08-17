class Event < ActiveRecord::Base
  belongs_to :convention
  belongs_to :day
  belongs_to :room
  belongs_to :track
end
