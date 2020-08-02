class API::TasksController < API::BaseController

  # GET /api/tasks?page=2&filter=no-complete
  def index
    tasks = Task.order('date')

    if params[:filter].present? && params[:filter] == 'no-complete'
      task_ids = current_user.statuses.where(completed: false).pluck(:task_id)
      tasks = tasks.where(id: task_ids)
    end

    tasks = tasks.page(params[:page]).per_page(16)
    tasks_print = if current_user
        TaskBlueprint.render tasks, view: :with_login, current_user_id: current_user.id
      else
        TaskBlueprint.render tasks, view: :public
      end
    render json: tasks_print
  end

  # PUT /api/tasks/:id/toggle
  def toggle
    status = current_user.statuses.find_by(task_id: params[:id])
    status.toggle!
    render json: status
  end
end
