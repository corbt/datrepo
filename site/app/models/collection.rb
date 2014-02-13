class Collection < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :title, 
    presence: true, 
    uniqueness: { scope: :user, message: "You already have a collection with that name" }
end
