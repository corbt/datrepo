class AddFavoritesCounterCaches < ActiveRecord::Migration
  def change
    add_column :datasets, :user_favorite_datasets_count, :integer, {default: 0, null: false}
    add_column :collections, :user_favorite_collections_count, :integer, {default: 0, null: false}
  end
end
