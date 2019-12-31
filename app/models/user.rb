class User < ApplicationRecord
    
    has_many :favorites
    has_many :parks, through: :favorites

    has_many :comments
    has_many :parks, through: :comments

    has_secure_password

    validates :name, presence: true
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, presence: true
end
