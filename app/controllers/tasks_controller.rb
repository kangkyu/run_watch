class TasksController < ApplicationController
  def index
    @tasks = Task.order('date').page(params[:page])
    @do_tasks = Task.where(completed: true).order('date')
    @un_tasks = Task.where(completed: false).order('date')
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
    @task.update(completed: params[:button])
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:episode, :date, :title, :completed)
  end
end