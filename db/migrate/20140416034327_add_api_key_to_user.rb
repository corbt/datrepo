class AddAPIKeyToUser < ActiveRecord::Migration
  def up
    add_column :users, :api_key, :string
    # User.all.each{ |u| u.update_attributes(api_key: SecureRandom.hex(20)) }
  end
  
  def down
    remove_column :users, :api_key, :string
  end
end
