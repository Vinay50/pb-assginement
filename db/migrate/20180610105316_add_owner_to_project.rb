class AddOwnerToProject < ActiveRecord::Migration[5.0]
  def change
    rename_column :projects, :manager_id, :owner_id
  end
end
