class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    binding.pry
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      @project
      render :new
    end
  end

  def show
    @project = Project.find_by(id: params[:id])
  end

  def edit
    @project = Project.find_by(id: params[:id])
  end

  def update
    authorize @project
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render :show
    end
  end

  def delete_collaborator
    authorize @project
    user = User.find_by(id: params[:user][:id])
    @project.collaborators.delete(user)
    @project.save
    redirect_to project_path(@project)
  end

  def complete_tasks
    @tasks = @project.tasks.complete
  end

  def complete
    @projects = (@user.complete_projects + @user.collaboration_projects.complete).reverse
  end

  def overdue
    @projects = (@user.projects.overdue + @user.collaboration_projects.overdue).reverse
  end

  ## PRIVATE METHODS

  private


  def project_params
    params.require(:project).permit(:name, :description, :collaborator_emails, :owner_id, :due_date, :status)
  end
end
