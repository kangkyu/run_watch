class API::TasksController < API::BaseController
  def index
    tasks = Task.order('date').page(params[:page]).per_page(16)
    render json: tasks
  end
end
