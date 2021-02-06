class AddUserRefToTeams < ActiveRecord::Migration[5.2]
  def change
    remove_column :teams, :user_id, :bigint
    add_reference :teams, :user, foreign_key: true
  end
end
