class Task < ActiveRecord::Base
  has_many :statuses
  has_many :users, through: :statuses
  
  validates :date, presence: true

  # def self.do_listing
  #   where(completed: true).order('date')
  # end

  # def self.un_listing
  #   where(completed: false).order('date')
  # end

  def self.task_listing
    order('date')
  end
end