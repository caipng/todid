class User < ApplicationRecord
    has_many :todos, dependent: :destroy
    has_secure_password
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, length: { minimum: 5 }
end
