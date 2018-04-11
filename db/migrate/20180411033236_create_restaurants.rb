class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :brand_name
      t.string :email
      t.string :tel
      t.string :address
      t.string :password_digest
      t.string :thumbnail
      t.string :company_name
      t.string :url

      t.timestamps
    end
  end
end
