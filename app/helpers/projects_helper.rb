module ProjectsHelper
  def user_role_for(user_id, project_id)
    user = UserProject.find_by(user_id: user_id, project_id: project_id)
    user&.role
  end
end
