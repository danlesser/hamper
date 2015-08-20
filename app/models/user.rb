class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 8 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :name, uniqueness: true
  validates :email, uniqueness: true, email_format: { message: 'Valid email addresses only.' },
                    length: { maximum: 40 }
end
