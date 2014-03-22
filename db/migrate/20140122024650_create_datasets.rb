class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.string :path
      t.integer :records
      t.decimal :size
      t.decimal :downloads
      t.references :user, index: true
      t.text :custom_license
      t.text :description
      t.string :title

      t.timestamps
    end
  end
end
