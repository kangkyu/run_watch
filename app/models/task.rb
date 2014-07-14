class Task < ActiveRecord::Base
  validates :episode, presence: true, uniqueness: true
end