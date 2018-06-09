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
      flash[:success] = "Project added successfully"
      redirect_to projects_path
    else
      flash[:error] = "Could not add project. Please try later"
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :due_date, :manager_id, :status)
  end
end
