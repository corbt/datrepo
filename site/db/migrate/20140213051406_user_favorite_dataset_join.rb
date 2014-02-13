class UserFavoriteDatasetJoin < ActiveRecord::Migration
  def change
    create_join_table :users, :datasets, table_name: :users_favorite_datasets do |t|
      t.index :user_id
      t.index :dataset_id
    end
  end
end
