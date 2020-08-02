class Task < ActiveRecord::Base
  has_many :statuses
  has_many :users, through: :statuses

  validates :date, presence: true

  def completed_by?(user_id)
    statuses.find_by(user_id: user_id).completed
  end
end
