class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
    	t.references :person # this is the donor
    	t.references :organization
    	t.float :amount
    	t.date :date
    	t.string :payment_method
    	t.string :campaign
    	t.string :solicitation_method
    	t.references :perk
    	t.integer :point_of_contact_id # references Person
      t.timestamps
    end
  end
end
