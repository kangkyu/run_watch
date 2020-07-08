class API::TasksController < API::BaseController

  # GET /api/tasks?page=2
  def index
    tasks = Task.order('date').page(params[:page]).per_page(16)
    tasks_print = if current_user
        TaskBlueprint.render tasks, view: :with_login, current_user_id: current_user.id
      else
        TaskBlueprint.render tasks, view: :public
      end
    render json: tasks_print
  end

  # PUT /api/tasks/:id/complete?button=true
  def complete
    status = current_user.statuses.find_by(task_id: params[:id])
    status.completed = params[:button]
    status.save
    head :no_content
  end
end
