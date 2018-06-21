class RemoveRolesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :roles, :integer
  end
end
