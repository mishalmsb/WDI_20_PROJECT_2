class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :team_one
      t.string :team_two
      t.string :winner
      t.date :date
      t.time :time

      t.timestamps null: false
    end
  end
end
