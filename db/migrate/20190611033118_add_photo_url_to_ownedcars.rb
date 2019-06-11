class AddPhotoUrlToOwnedcars < ActiveRecord::Migration[5.2]
  def change
    add_column :ownedcars, :photo_url, :string
  end
end
