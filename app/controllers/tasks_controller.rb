class TasksController < ApplicationController
  before_filter :set_project
  # before_filter :set_task

  def index
  end

  def new
    @task = Project.new
  end

  def create
    @task = Task.new(task_params)
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

 def show
    @project = @task.project
    @comment = Comment.new
    @comments = @task.comments.reverse
    @assigned_users = @task.assigned_users
    @tags = @task.tags
  end

  def edit
    @project = @task.project
    @task_users = task_users
  end

  def update
    @task.update(task_params)
    if task_params[:tag_names]
      @task.update(tag_names: task_params[:tag_names])
    end
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to project_tasks_path(@project)
  end

  def delete
  end

  private

 def set_user
    @user = current_user
  end

  def set_task
    @task = Task.find_by(id: params[:id])
  end

  def set_project
    @project = Project.find_by(id: params[:project_id])
  end

  def project_task_statuses_count
    @overdue = @project.overdue_tasks.count
    @active = @project.active_tasks.count
    @complete = @project.complete_tasks.count
  end

  def all_task_statuses_count
    @overdue = (current_user.overdue_tasks + current_user.overdue_assigned_tasks).uniq.count
    @active = (current_user.active_tasks + current_user.active_assigned_tasks).uniq.count
    @complete= (current_user.complete_tasks + current_user.complete_tasks).uniq.count
  end

  def task_params
    params.require(:task).permit(:name, :description, :project_id, :owner_id, :due_date, :status, :tag_names, assigned_user_ids: [], tag_ids: [])
  end

  def task_users
    task_users = []
    task_users << @task.project.collaborators
    task_users << @user
    task_users.flatten
  end

end

