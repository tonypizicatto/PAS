class AddBelongsTaskToUserAndProject < ActiveRecord::Migration[5.2]
  def change
    change_table :tasks do |t|
      t.belongs_to :project
      t.belongs_to :user
    end
  end
end
