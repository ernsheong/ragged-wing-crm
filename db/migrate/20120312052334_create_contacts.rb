class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :role
      t.string :phone_1
      t.string :phone_2
      t.string :phone_3
      t.string :email_1
      t.string :email_2
      t.string :street_1
      t.string :city_1
      t.string :state_1
      t.string :zip_1
      t.string :country_1
      t.string :street_2
      t.string :city_2
      t.string :state_2
      t.string :zip_2
      t.string :country_2
      t.string :website_1
      t.string :website_2
      t.string :other
      t.boolean :internal
      # t.references relationship
      # t.references organization

      # Recorded Info
      t.timestamps
    end
  end
end
