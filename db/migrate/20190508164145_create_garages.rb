# frozen_string_literal: true

class CreateGarages < ActiveRecord::Migration[5.2]
  def change
    create_table :garages do |t|
      t.references :user, foreign_key: true
      t.integer :capacity
      t.integer :car_count

      t.timestamps
    end
  end
end
