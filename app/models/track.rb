class Track < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :convention },
                   format: { with: /\A[[:alpha:]0-9 ]+\z/, message: 'Alphanumeric characters (and spaces) only.' }
  validates :rank, presence: true, uniqueness: { scope: :convention }
  belongs_to :convention
end
