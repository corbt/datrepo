class UserFavoriteCollection < ActiveRecord::Base
  @table_name = "users_favorite_collections"

  belongs_to :user
  belongs_to :collection, counter_cache: true

  validates :collection, uniqueness: {scope: :user}
end