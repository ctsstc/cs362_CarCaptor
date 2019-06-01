# frozen_string_literal: true

class CreateOwnedcars < ActiveRecord::Migration[5.2]
  def change
    create_table :ownedcars do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.integer :coolness_value
      t.integer :horsepower
      t.integer :torque
      t.integer :weight
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
