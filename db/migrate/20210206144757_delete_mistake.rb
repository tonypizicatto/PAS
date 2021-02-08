class DeleteMistake < ActiveRecord::Migration[5.2]
  def change
    remove_column :teams, :user_id, :bigint
    add_belongs_to :teams, :user_id
  end
end
