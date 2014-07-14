module ApplicationHelper

  def show_date(d)
    d.strftime("%F") if d
  end

  def status(s)
    if s
     'completed' 
    else
     'incomplete'
    end 
  end
  
end
