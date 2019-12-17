class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :park

  validates_uniqueness_of :park_id, :scope => :user_id
end
