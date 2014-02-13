class CollectionDatasetJoin < ActiveRecord::Migration
  def change
    create_join_table :collections, :datasets do |t|
      t.index :collection_id
      t.index :dataset_id
    end
  end
end
