class UserFavoriteCollectionJoin < ActiveRecord::Migration
  def change
    create_join_table :users, :collections, table_name: :users_favorite_collections do |t|
      t.index :user_id
      t.index :collection_id
    end
  end
end
