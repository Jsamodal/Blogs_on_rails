class User < ApplicationRecord
    
    has_secure_password
    has_many :blogs, dependent: :nullify
    has_many :comments, dependent: :nullify

    def full_name
        "#{first_name} #{last_name}"
    end
    
end
