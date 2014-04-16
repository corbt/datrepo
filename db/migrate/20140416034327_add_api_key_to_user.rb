class AddAPIKeyToUser < ActiveRecord::Migration
  def change
    add_column :users, :api_key, :string
    add_index :users, :api_key
    # User.all.each{ |u| u.update_attributes(api_key: SecureRandom.hex(20)) }
  end
end
