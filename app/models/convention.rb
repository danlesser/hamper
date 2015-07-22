class Convention < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true,
                    format: { with: /\A[\w ]+\z/, message: 'Alphanumeric characters (and spaces) only.' },
                    length: { maximum: 40 }
  validates :convention_email, presence: true, uniqueness: true, email_format: { message: 'Valid email addresses only.' },
                               length: { maximum: 40 }
  has_many :days
  has_many :tracks
  has_many :rooms
end
