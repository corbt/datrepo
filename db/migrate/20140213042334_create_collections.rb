class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.references :user, index: true
      t.string :title

      t.timestamps
    end
  end
end
