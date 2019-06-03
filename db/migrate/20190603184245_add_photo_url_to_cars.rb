class AddPhotoUrlToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :photo_url, :string
  end
end
