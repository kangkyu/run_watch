class TasksController < ApplicationController

  def index
    params[:page] ||= session[:page]
    @tasks = Task.task_listing.page(params[:page]).per_page(24)
    session[:page] = params[:page]

    # @do_tasks = Task.do_listing.page(params[:page]).per_page(12)
    # @un_tasks = Task.un_listing.page(params[:page]).per_page(12)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    else
      render 'new', notice: 'please try again different'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render 'edit', notice: 'please try again different'
    end
  end

  def complete
    # Task.where(id: params[:task_ids]).update_all(completed: true)
    @task = Task.find(params[:id])
    status = @task.statuses.find_by(user_id: current_user.id) 
    status.completed = params[:button]
    status.save
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:episode, :date, :title)
  end
end