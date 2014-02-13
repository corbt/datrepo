class UserFavoriteDataset < ActiveRecord::Base
  @table_name = "users_favorite_datasets"

  belongs_to :user
  belongs_to :dataset
end