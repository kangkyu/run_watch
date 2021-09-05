require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  def test_does_not_save_without_date
    task = Task.new
    assert_not task.save
  end

  def test_has_users
    start = Date.new(2010,7,11)
    task = Task.new(date: start)
    assert_respond_to task, :users
  end
end
