class AddRestaurantToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :restaurant, foreign_key: true
  end
end
