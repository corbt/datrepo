class AddIdToFavorites < ActiveRecord::Migration
  def change
    add_column :users_favorite_datasets, :id, :primary_key
    add_column :users_favorite_collections, :id, :primary_key
  end
end
