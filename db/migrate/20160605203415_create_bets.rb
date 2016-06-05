class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :user_id
      t.integer :user_two_id
      t.integer :value
      t.string :status
      t.integer :game_id

      t.timestamps null: false
    end
  end
end
