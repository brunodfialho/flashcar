class RemoveLatitudeAndLongitudeFromCars < ActiveRecord::Migration[6.0]
  def change
    remove_column :cars, :lat, :decimal
    remove_column :cars, :lng, :decimal
  end
end
