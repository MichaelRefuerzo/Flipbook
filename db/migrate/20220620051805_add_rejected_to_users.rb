class AddRejectedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :rejected, :boolean, default: false
  end
end
