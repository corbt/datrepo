class AddDefaultsToDataset < ActiveRecord::Migration
  def change
    change_column_default :datasets, :records, 0
    change_column_default :datasets, :size, 0
    change_column_default :datasets, :downloads, 0
  end
end
