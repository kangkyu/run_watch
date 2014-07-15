module ApplicationHelper

  def show_date(d)
    d.strftime("%F") if d
  end

  def task_status(s)
    if s
     'w' 
    else
     'o'
    end 
  end
  
end
