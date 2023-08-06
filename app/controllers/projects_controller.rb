class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @user_project = @project.user_projects
  end

  def new
    @users = User.all
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
    # @user_project = @project.user_projects.pluck(:user_id)
    @users = User.all
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      @project.user_projects.destroy_all
      params["project"]["user_ids"].each do |user_id|
        @project.user_projects.create(user_id: user_id)
      end
      redirect_to projects_path, notice: 'Project was successfully updated.'
    else
      puts @user.errors.full_messages
      render :edit
    end
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
