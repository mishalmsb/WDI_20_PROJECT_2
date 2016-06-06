class AddFinishTimeNumberToGames < ActiveRecord::Migration
  def change
    add_column :games, :finish_time, :integer
  end
end
