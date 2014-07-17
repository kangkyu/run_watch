class User < ActiveRecord::Base
  has_many :statuses
  has_many :tasks, through: :statuses
  
  validates :username, presence: true

  # has_secure_password
end