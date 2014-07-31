module ApplicationHelper

  def show_date(d)
    d.strftime("%F") if d
  end
 
end
