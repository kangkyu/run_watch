class API::TasksController < API::BaseController

  # GET /api/tasks?page=2&filter=no-complete
  def index
    load_tasks
    filter_tasks
    paginate_tasks
    render json: tasks_print
  end

  # PUT /api/tasks/:id/toggle
  def toggle
    require_login do
      load_task
      render json: toggled_status
    end
  end

  private

  def load_task
    @task = Task.find(params[:id])
  end

  def load_tasks
    @tasks = Task.order('date')
  end

  def paginate_tasks
    @tasks = @tasks.page(params[:page]).per_page(16)
  end

  def filter_tasks
    if current_user.present? && params[:filter] == 'no-complete'
      @tasks = @tasks.no_complete(current_user.id)
    end
  end

  def tasks_print
    if current_user.present?
      TaskBlueprint.render @tasks, view: :with_login, current_user_id: current_user.id
    else
      TaskBlueprint.render @tasks, view: :public
    end
  end

  def toggled_status
    @task.status_toggled_for(current_user.id)
  end
end
