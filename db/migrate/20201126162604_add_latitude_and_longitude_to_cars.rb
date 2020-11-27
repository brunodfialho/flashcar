class AddLatitudeAndLongitudeToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :lat, :decimal
    add_column :cars, :lng, :decimal
  end
end
