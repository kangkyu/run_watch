class TasksController < ApplicationController

  def index
    @tasks = Task.order('date').page(params[:page]).per_page(24)
  end

  def uncompleted
    task_ids = []
    current_user.statuses.where(completed: false).each do |status|
      task_ids << status.task_id
    end 
    @tasks = Task.where(id: task_ids).order('date').page(params[:page]).per_page(12)
  end

  def new
    if current_user
      @task = Task.new
    else
      redirect_to login_path
    end
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      User.all.each_with_index do |user, i|
        Status.create(task_id: @task.id, user_id: i+1, completed: false)
      end
      redirect_to root_path
    else
      render 'new', notice: 'please try again different'
    end
  end

  def edit
    if current_user
      @task = Task.find(params[:id])
    else
      redirect_to login_path
    end
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
    redirect_to :back
  end

  private

  def task_params
    params.require(:task).permit(:episode, :date, :title)
  end
end