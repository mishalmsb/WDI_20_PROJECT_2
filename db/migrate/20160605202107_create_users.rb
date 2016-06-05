class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :money
      t.string :nationality
      t.string :notes
      t.string :picture

      t.timestamps null: false
    end
  end
end
