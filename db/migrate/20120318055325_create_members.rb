class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :person
      t.references :organization
      t.string :role
      t.timestamps
    end
  end
end
