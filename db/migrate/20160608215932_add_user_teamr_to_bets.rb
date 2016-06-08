class AddUserTeamrToBets < ActiveRecord::Migration
  def change
    add_column :bets, :user_team, :string
  end
end
