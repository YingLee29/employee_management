class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, notice: 'Project was successfully created.'
    else
      render root_path, notice: 'Project was unsuccessfully created.'
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :information, :deadline, :project_type, :status)
  end
end
