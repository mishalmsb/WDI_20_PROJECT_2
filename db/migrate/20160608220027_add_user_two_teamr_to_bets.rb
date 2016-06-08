class AddUserTwoTeamrToBets < ActiveRecord::Migration
  def change
    add_column :bets, :user_two_team, :string
  end
end
