class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 8 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :name, presence: true,
                   format: { with: /\A[\w ]+\z/, message: 'Alphanumeric characters (and spaces) only.' },
                   length: { maximum: 40 }
  validates :email, presence: true, uniqueness: true, email_format: { message: 'Valid email addresses only.' },
                    length: { maximum: 40 }
end
