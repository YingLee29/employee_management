class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @users = User.all
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      params["project"]["user_ids"].each do |user_id|
        @project.user_projects.create(user_id: user_id)
      end
      redirect_to projects_path, notice: 'Project was successfully created.'
    else
      render root_path, notice: 'Project was unsuccessfully created.'
    end
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    redirect_to projects_path, notice: 'Project and associotice: Project was successfully destroyed.'
  end

  private
  def project_params
    params.require(:project).permit(:name, :information, :deadline, :project_type, :status)
  end
end
