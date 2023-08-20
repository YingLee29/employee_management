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

  def create
    @users = User.all
    @list_members = []
    @project = Project.create_with_user_roles(project_params: project_params, user_roles: params[:user_roles])
    if @project.persisted?
      redirect_to projects_path, notice: 'Project was successfully created'
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
    @users = User.all
    @list_members = User.where(id: @project.user_projects.pluck(:user_id))
  end

  def update
    project = Project.find(params[:id])
    ActiveRecord::Base.transaction do
      if project.update_with_user_roles(project_params: project_params, user_roles: params[:user_roles])
        redirect_to projects_path, notice: 'Project was successfully updated'
      else
        flash[:alert] = "can't update project"
        render :edit
      end
    end
  end

  def list_members
    @project = Project.find_by(id: params[:project_id])
    list_member_ids = params[:user_ids]
    @list_members = User.where(id: params[:user_ids])
  end

  def destroy
    project = Project.find(params[:id])
    if project.destroy
      redirect_to projects_path, notice: 'Project was successfully destroyed'
    else
      flash[:alert] = 'Delete failed project'
      redirect_to projects_path
    end
  end
  private

  def project_params
    params.require(:project).permit(:name, :information, :deadline, :project_type, :status)
  end
end
