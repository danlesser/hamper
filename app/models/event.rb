class Event < ActiveRecord::Base
  ALPHANUM_ERROR_MESSAGE = 'Alphanumeric characters, spaces and sensible punctuation only.'

  belongs_to :convention
  belongs_to :day
  belongs_to :room
  belongs_to :track

  validates :timetable_name, presence: true, length: { maximum: 50 },
                             format: { with: /\A[\w \.,'";:\-\?!\(\)]+\z/, message: ALPHANUM_ERROR_MESSAGE }
  validates :conbook_name, presence: true, length: { maximum: 50 },
                           format: { with: /\A[\w \.,'";:\-\?!\(\)]+\z/, message: ALPHANUM_ERROR_MESSAGE }
  validates :conbook_description, length: { maximum: 500 },
                                  format: { with: /\A[\w \.,'";:\-\?!\(\)]+\z/, message: ALPHANUM_ERROR_MESSAGE }
  validates :start_time, presence: true
  validates :setup_duration, presence: true
  validates :seating_duration, presence: true
  validates :event_duration, presence: true
  validates :teardown_duration, presence: true
  validates :room_layout, length: { maximum: 100 },
                          format: { with: /\A[\w \.,'";:\-\?!\(\)]+\z/, message: ALPHANUM_ERROR_MESSAGE }
  validates :convention_equipment, length: { maximum: 500 },
                                   format: { with: /\A[\w \.,'";:\-\?!\(\)]+\z/, message: ALPHANUM_ERROR_MESSAGE }
  validates :hotel_equipment, length: { maximum: 500 },
                              format: { with: /\A[\w \.,'";:\-\?!\(\)]+\z/, message: ALPHANUM_ERROR_MESSAGE }
  validates :event_runners, length: { maximum: 200 },
                            format: { with: /\A[\w \.,'";:\-\?!\(\)]+\z/, message: ALPHANUM_ERROR_MESSAGE }
  validates :notes, length: { maximum: 10_000 },
                    format: { with: /\A[\w \.,'";:\-\?!\(\)]+\z/, message: ALPHANUM_ERROR_MESSAGE }

  delegate :name, to: :day, prefix: true
  delegate :name, to: :room, prefix: true
  delegate :name, to: :track, prefix: true

  def formatted_start_time
    start_time.to_s(:time)
  end
end
