class Room < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :convention },
                   format: { with: /\A[\w ]+\z/, message: 'Alphanumeric characters (and spaces) only.' },
                   length: { maximum: 40 }
  belongs_to :convention
end
