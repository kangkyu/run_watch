class Task < ActiveRecord::Base
  validates :date, presence: true

  def self.do_listing
    where(completed: true).order('date')
  end

  def self.un_listing
    where(completed: false).order('date')
  end

  def self.task_listing
    order('date')
  end
end