class Park < ApplicationRecord
    has_many :favorites
    has_many :users, through: :favorites

    has_many :comments
    has_many :users, through: :comments

    validates :name, presence: true
    validates :state, presence: true
    validates :url, presence: true
    validates :description, presence: true
    validates :image, presence: true
    validates :lat, presence: true
    validates :long, presence: true

end
