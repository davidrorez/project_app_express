class User < ApplicationRecord

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :role, presence: true
  enum role: { "admin": 0, "kitchen": 1 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
