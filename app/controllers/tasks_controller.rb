class TasksController < ApplicationController
  before_filter :set_project
  # before_filter :set_task

  def index
  end

  def new
    @task = Project.new
  end

  def create
    @task = Project.new(task_params)
    if @task.save
      flash[:success] = "Task added"
      redirect_to task_path(@task)
    else
      flash[:error] = "Could not add task."
      render :new
    end
  end

  def quick_new_task
    @task = Task.new
    @projects = @user.active_projects + @user.collaboration_projects.active
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def set_project
    @project = Project.find_by(id: params[:project_id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :due_date, :status, :project_id, :owner_id, assigned_user_ids: [])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_users
    task_users = []
    task_users << @task.project.collaborators
    task_users << @user
    task_users.flatten
  end

end

