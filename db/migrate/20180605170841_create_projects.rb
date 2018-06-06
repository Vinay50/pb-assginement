class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.datetime :due_date
      t.integer :manager_id, class_name: "User"
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
