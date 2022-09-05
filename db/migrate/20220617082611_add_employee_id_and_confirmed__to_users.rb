class AddEmployeeIdAndConfirmedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :employee_id, :integer
    add_column :users, :confirmed, :boolean
  end
end
