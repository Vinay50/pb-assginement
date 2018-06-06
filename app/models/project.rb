class Project < ApplicationRecord

  belongs_to :manager, class_name: "User"
  has_many :user_projects, foreign_key: "collaboration_project_id"
  has_many :collaborators, through: :user_projects

  enum status: [:active, :complete]
  validates :name, :due_date, :status, :description, presence: true
end
