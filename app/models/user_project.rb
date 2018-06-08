class UserProject < ApplicationRecord
   belongs_to :collaboration_project, class_name: "Project"
   belongs_to :collaborator, class_name: "User"
   enum permission: [:View, :Edit]
end
