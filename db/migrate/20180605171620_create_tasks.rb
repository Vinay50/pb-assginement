class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.datetime :due_date
      t.integer :owner_id
      t.integer :status, default: 0
      t.integer :project_id
      t.timestamps
    end
  end
end
