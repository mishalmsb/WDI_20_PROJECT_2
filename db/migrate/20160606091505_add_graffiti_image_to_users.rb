class AddGraffitiImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :graffiti_image, :string
  end
end
