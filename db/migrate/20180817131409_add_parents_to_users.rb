class AddParentsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :parent_1, :integer
    add_column :users, :parent_2, :integer
  end
end
