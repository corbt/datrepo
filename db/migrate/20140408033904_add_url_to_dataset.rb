class AddUrlToDataset < ActiveRecord::Migration
  def change
    add_column :datasets, :url, :string
  end
end
