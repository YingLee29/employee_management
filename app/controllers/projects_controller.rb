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
    @list_members = []
  end

  def edit
    @project = Project.find(params[:id])
    @users = User.all
    @list_members = []
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      @project.user_projects.destroy_all
      params["user_roles"].each do |user_id, role|
        @project.user_projects.create(user_id: user_id, role: role)
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
      params["user_roles"].each do |user_id, role|
        @project.user_projects.create(user_id: user_id, role: role)
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

  def list_members
    list_member_ids = params[:user_ids]
    @list_members = User.where(id: params[:user_ids])
  end

  private
  def project_params
    params.require(:project).permit(:name, :information, :deadline, :project_type, :status)
  end
end
