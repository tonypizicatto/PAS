class AddBelongsProjectToUserFix < ActiveRecord::Migration[5.2]
  def change
    change_table :projects do |t|
      t.belongs_to :user
    end
  end
end
