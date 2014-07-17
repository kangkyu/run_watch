class TasksController < ApplicationController
  before_action :current_user

  def index
    params[:page] ||= session[:page]
    @tasks = Task.order('date').page(params[:page]).per_page(27)
    session[:page] = params[:page]

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
      redirect_to @tasks
    else
      render 'edit', notice: 'please try again different'
    end
  end

  def complete
    # Task.where(id: params[:task_ids]).update_all(completed: true)
    @task = Task.find(params[:id])
    status = Status.find_by(task_id: @task.id, user_id: @user.id) 
    status.completed = params[:button]
    status.save
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:episode, :date, :title)
  end

  def current_user
    @user = User.first
  end
end