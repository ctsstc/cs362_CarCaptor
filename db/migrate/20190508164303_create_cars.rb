# frozen_string_literal: true

class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.integer :coolness_value
      t.integer :horsepower
      t.integer :torque
      t.integer :weight

      t.timestamps
    end
  end
end
