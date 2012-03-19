class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.references :person # contact person
      t.references :address
      t.string :website
      t.string :type 
      t.timestamps
    end
  end
end
