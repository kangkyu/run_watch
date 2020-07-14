class Status < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

  def toggle!
    if self.completed = !completed
      self.completed_at = Time.now
    else
      self.completed_at = nil
    end
    save
  end
end
