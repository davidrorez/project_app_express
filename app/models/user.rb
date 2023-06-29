class User < ApplicationRecord

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
  validates :role, presence: true

  enum role: { "admin": 0, "kitchen": 1 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
