class API::TasksController < API::BaseController

  # GET /api/tasks?page=2&filter=no-complete
  def index
    @tasks = Task.order('date')
    tasks_print = if current_user.present?
      filter_tasks if params[:filter] == 'no-complete'
      paginate_tasks
      TaskBlueprint.render @tasks, view: :with_login, current_user_id: current_user.id
    else
      paginate_tasks
      TaskBlueprint.render @tasks, view: :public
    end
    render json: tasks_print
  end

  # PUT /api/tasks/:id/toggle
  def toggle
    require_login do
      status = status_scope.find_by(task_id: params[:id])
      status.toggle!
      render json: status
    end
  end

  private

  def status_scope
    Status.where(user_id: current_user.id)
  end

  def paginate_tasks
    @tasks = @tasks.page(params[:page]).per_page(16)
  end

  def filter_tasks
    incomplete_task_ids = status_scope.where(completed: false).pluck(:task_id)
    @tasks = @tasks.where(id: incomplete_task_ids)
  end
end
