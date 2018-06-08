class Task < ApplicationRecord

  belongs_to :project

  has_many :user_tasks, foreign_key: "assigned_task_id"
  has_many :assigned_users, through: :user_tasks
  belongs_to :manager, class_name: "User"

  enum status: [:active, :complete]

  validates :name, :description, :due_date, :status, :project_id, presence: true

end
