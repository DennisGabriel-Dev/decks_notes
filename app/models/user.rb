class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :password, presence: true, length: { minimum: 8, maximum: 20 }, on: :create

  has_many :notebooks
  has_many :tasks
  has_many :comments
end
