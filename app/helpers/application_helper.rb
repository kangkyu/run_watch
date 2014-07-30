module ApplicationHelper

  def show_date(d)
    d.strftime("%F") if d
  end

  def task_status(task_id, user_id)
    Status.find_by(task_id: task_id, user_id: user_id).completed

  end
  
end
