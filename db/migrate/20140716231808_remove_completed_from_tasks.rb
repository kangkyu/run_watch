class RemoveCompletedFromTasks < ActiveRecord::Migration
  def change
    User.create(username: "First_User") # first user

    Task.all.each_with_index do |task, i|
      if task.completed
        Status.create(user_id: 1, task_id: i+1, completed: task.completed)
      end
    end

    # move column data into another table (into a column of first user)

    # migration file

    remove_column :tasks, :completed
  end
end
