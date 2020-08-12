class User < ActiveRecord::Base
  has_many :statuses, dependent: :destroy
  has_many :tasks, through: :statuses, dependent: :destroy

  validates :username, presence: true, uniqueness: true

  has_secure_password

  after_create :populate_statuses_all_tasks

  private

  # TODO: do we really need to do this?
  def populate_statuses_all_tasks
    Task.all.each_with_index do |task, i|
      if task.title != 'cancel'
        Status.create(user_id: id, task_id: task.id, completed: false)
      end
    end
  end
end
