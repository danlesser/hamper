class Track < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :convention },
                   format: { with: /\A[\w ]+\z/, message: 'Alphanumeric characters (and spaces) only.' },
                   length: { maximum: 40 }
  validates :rank, presence: true, uniqueness: { scope: :convention }
  belongs_to :convention
  has_many :events, dependent: :destroy
end
