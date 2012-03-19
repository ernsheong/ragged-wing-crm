class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :phone_cell
      t.string :phone_home
      t.string :phone_office
      t.string :email1
      t.string :email2
      t.integer :address_id_1 # references Address
      t.integer :address_id_2 # references Address
      t.string :website1
      t.string :website2
      t.string :other
      t.timestamps
    end
  end
end
