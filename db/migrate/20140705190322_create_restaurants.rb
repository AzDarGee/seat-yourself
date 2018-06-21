class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :description
      t.integer :capacity
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
