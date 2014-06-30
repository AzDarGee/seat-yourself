class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :price_range
      t.string :summary

      t.timestamps
    end
  end
end
