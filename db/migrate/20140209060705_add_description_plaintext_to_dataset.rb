class AddDescriptionPlaintextToDataset < ActiveRecord::Migration
  def change
    add_column :datasets, :description_plaintext, :text
  end
end
