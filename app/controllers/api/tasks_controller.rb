class API::TasksController < API::BaseController
  def index
    tasks = Task.order('date').page(params[:page]).per_page(16)
    tasks_print = if current_user
        TaskBlueprint.render tasks, view: :with_login, current_user_id: current_user.id
      else
        TaskBlueprint.render tasks, view: :public
      end
    render json: tasks_print
  end
end
