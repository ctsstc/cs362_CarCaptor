class User < ApplicationRecord
  has_one :garage
  after_create :add_garage

  private

  def add_garage
    self.garage = Garage.new(user: self)
  end
end
