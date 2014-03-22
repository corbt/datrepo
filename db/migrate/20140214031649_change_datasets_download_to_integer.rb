class ChangeDatasetsDownloadToInteger < ActiveRecord::Migration
  def up
    change_column :datasets, :downloads, :integer
  end

  def down
    change_column :datasets, :downloads, :decimal
  end
end
