class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string   :title
      t.string :content
      t.string :status
      t.datetime :start_date
      t.datetime :due_date
      t.integer :estimation
      t.timestamps
    end
  end
end
