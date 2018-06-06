class CreateUserProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :user_projects do |t|
      t.integer :collaborator_id
      t.integer :collaboration_project_id
      t.integer :permission, default: 0

      t.timestamps
    end
  end
end
