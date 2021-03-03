class AddIndexToTasksAndProjects < ActiveRecord::Migration[5.2]
  def change
    add_index :tasks, [:title, :project_id], unique: true
  end
end
