class UserFavoriteCollection < ActiveRecord::Base
  @table_name = "users_favorite_collections"

  belongs_to :user
  belongs_to :collection
end