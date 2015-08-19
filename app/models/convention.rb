class Convention < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true,
                    format: { with: /\A[\w ]+\z/, message: 'Alphanumeric characters (and spaces) only.' },
                    length: { maximum: 40 }
  validates :convention_email, presence: true, uniqueness: true, email_format: { message: 'Valid email addresses only.' },
                               length: { maximum: 40 }
  has_many :days, dependent: :destroy
  has_many :tracks, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :events, dependent: :destroy
end
