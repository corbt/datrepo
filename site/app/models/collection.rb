class Collection < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :datasets

  has_many :user_favorite_collections, dependent: :destroy
  has_many :favoriting_users, through: :user_favorite_collections, source: :user

  validates :user, presence: true
  validates :title, 
    presence: true, 
    uniqueness: { scope: :user, message: "You already have a collection with that name" }
end
