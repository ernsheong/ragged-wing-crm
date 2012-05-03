class CreateRelationshipPersonLists < ActiveRecord::Migration
  def change
    create_table :relationship_person_lists do |t|
      t.integer :person_id
      t.integer :list_id

      t.timestamps
    end
  end
end
