class Track < ActiveRecord::Base
  validates :name, presence: true,
                   format: { with: /\A[[:alpha:]0-9 ]+\z/, message: 'Alphanumeric characters (and spaces) only.' }
  validates :rank, presence: true
  belongs_to :convention
end
