class Task < ActiveRecord::Base
  has_many :statuses
  has_many :users, through: :statuses

  validates :date, presence: true

  scope :no_complete, -> (user_id) do
    complete_ids = Status.where(user_id: user_id, completed: false).pluck(:task_id)
    where(id: complete_ids)
  end

  def completed_by?(user_id)
    statuses.find_by(user_id: user_id).completed?
  end

  def status_toggled_for(user_id)
    status = statuses.find_by(user_id: user_id)
    status.toggle!
    status
  end

  after_create :populate_statuses_all_users

  private

  # TODO: do we really need to do this?
  def populate_statuses_all_users
    User.all.each_with_index do |user, i|
      Status.create(task_id: id, user_id: user.id, completed: false)
    end
  end
end
