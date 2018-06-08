class UserTask < ApplicationRecord
  belongs_to :assigned_task, class_name: "Task"
  belongs_to :assigned_user, class_name: "User"

end
