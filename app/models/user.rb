class User < ApplicationRecord
    has_secure_password

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    validates :password, presence: true, length: { minimum: 6 }
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                                uniqueness: { case_sensitive: false }
end
