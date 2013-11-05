class UpdateAddressFieldsForRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :address
    remove_column :restaurants, :phone_number

    add_column :restaurants, :street, :string
    add_column :restaurants, :city, :string
    add_column :restaurants, :state, :string
    add_column :restaurants, :zip, :string
    add_column :restaurants, :phone, :string
  end
end
