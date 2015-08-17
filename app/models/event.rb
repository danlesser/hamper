class Event < ActiveRecord::Base
  belongs_to :convention
  belongs_to :day
  belongs_to :room
  belongs_to :track

  delegate :name, to: :day, prefix: true
  delegate :name, to: :room, prefix: true
  delegate :name, to: :track, prefix: true
end
