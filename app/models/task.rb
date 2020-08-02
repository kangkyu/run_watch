class Task < ActiveRecord::Base
  has_many :statuses
  has_many :users, through: :statuses

  validates :date, presence: true

  def completed_by?(user_id)
    statuses.find_by(user_id: user_id).completed
  end

  def status_toggled_for(user_id)
    status = statuses.where(user_id: user_id).take
    status.toggle!
    status
  end

  def self.no_complete(user_id)
    where id: Status.where(user_id: user_id, completed: false).pluck(:task_id)
  end
end
