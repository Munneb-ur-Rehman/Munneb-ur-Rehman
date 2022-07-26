class AddUserfnameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :userfname, :string
  end
end
