# frozen_string_literal: true

class AddGarageToCar < ActiveRecord::Migration[5.2]
  def change
    add_reference :cars, :garage, foreign_key: true
  end
end
