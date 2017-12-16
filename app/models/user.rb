class User < ActiveRecord::Base
  has_many :statuses, dependent: :destroy
  has_many :tasks, through: :statuses, dependent: :destroy

  validates :username, presence: true, uniqueness: true

  has_secure_password
end
